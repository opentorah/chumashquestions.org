package org.podval.chumashquestions

import org.scalatest.funsuite.AnyFunSuite
import java.nio.charset.StandardCharsets
import java.nio.file.{Files, Path, Paths}
import scala.jdk.CollectionConverters.ListHasAsScala

final class QuestionedWordsSpec extends AnyFunSuite:
  private val root: Path = Paths.get("").toAbsolutePath
  private val questionedWords: Path = root.resolve("questioned-words.md")
  private val glossary: Path = root.resolve("book/glossary.adoc")

  test("questioned-words.md and glossary.adoc are present") {
    assert(Files.isRegularFile(questionedWords), s"missing $questionedWords")
    assert(Files.isRegularFile(glossary), s"missing $glossary")
  }

  test("glossary entries for questioned words stay undefined") {
    val markdown: String = Files.readString(questionedWords, StandardCharsets.UTF_8)
    val tables: Seq[Seq[Seq[String]]] = QuestionedWordsSpec.markdownTables(markdown)
    assert(tables.size >= 2, "questioned-words.md must have the term table and the exceptions table")

    val questioned: Set[String] = tables.head.drop(1).flatMap(row => QuestionedWordsSpec.termIds(row(3))).toSet
    val documented: Set[String] = tables(1).drop(1).flatMap(row => QuestionedWordsSpec.termIds(row.head)).toSet
    val definitions: Map[String, String] = QuestionedWordsSpec.glossaryDefinitions(glossary)

    val added: Seq[(String, String)] = questioned.toSeq.sorted.flatMap: id =>
      definitions.get(id).filter(_.nonEmpty).filter(_ => !documented.contains(id)).map(id -> _)

    assert(
      added.isEmpty,
      added.map((id, definition) => s"$id: $definition").mkString(
        "glossary definitions for questioned words (add to the exceptions table only if intentional):\n",
        "\n",
        ""
      )
    )
  }

object QuestionedWordsSpec:
  def markdownTables(markdown: String): Seq[Seq[Seq[String]]] =
    markdown.split("\n(?=## )").toSeq.map: block =>
      block.linesIterator
        .map(_.trim)
        .filter(line => line.startsWith("|") && !line.startsWith("|---") && !line.startsWith("| --"))
        .map(parseRow)
        .filter(_.exists(_.nonEmpty))
        .toSeq
      .filter(_.nonEmpty)

  def parseRow(line: String): Seq[String] =
    line.stripPrefix("|").stripSuffix("|").split("\\|", -1).toSeq.map(_.trim)

  def termIds(cell: String): Seq[String] =
    cell.split(',').toSeq.map(_.trim).filter(_.nonEmpty).filterNot: token =>
      token.startsWith("(") || token.startsWith("“") || token.startsWith("\"")

  def glossaryDefinitions(path: Path): Map[String, String] =
    val entry = raw"\[\[([^\]]+)\]\].*?::(.*)".r
    Files.readAllLines(path, StandardCharsets.UTF_8).asScala.toSeq.flatMap:
      case entry(id, definition) => Some(id -> definition.trim)
      case _ => None
    .toMap
