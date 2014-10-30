chumash-questions
=================

Rabbi Wichnin's Chumash Questions



Buid
----

Maven build uses docbkx plugin for DocBook processing.

I tried to minimize the POM and put as much of the DocBook XSL configuration as possible into the XSL customization layer,
so that Oxygen build is easier to configure: only what is done in the POM needs to be replicated in Oxygen.

On the other hand, some configuration that could be placed in the XSL files was placed in the POM:
 - to be near the related bits of configuration (img.src.path and copying of the images) or
 - to centralize configuration and avoid duplication (font configuration).

In the end, only PDF build is replicated in Oxygen, but HTML and (HTML-based) EPUB are not. The reasons:

- Images and stylesheets need to be copied to the output; XSLT processor doesn't do it.
  In Maven, I used preProcess element of the docbkx's configuration.
  In Oxygen, I'll need to write scripts...

- For HTML builds, font family and size need to be inserted into the CSS stylesheet (for PDF, setting appropriate parameters is enough).
  In Maven, I use filtering when copying the stylesheets.
  In Oxygen, I do not know how to do this without duplicating the information.

To make the build Maven/Oxygen-neutral, I reference (in the customization layer) XSL files from the official docbook5 stylesheets distribution.
Oxygen brings its own copy (as a part of the DocBook framework), but if I reference that, Maven build will only work when Oxygen is installed.

DocBook plugin brings another copy of DocBook XSL as a Maven dependency. If I reference that, Oxygen build will break.
Which is a pity, because the plugin also provides a very nice way of referencing the XSL files: instead of the (system-dependent) path, one
can use "urn:docbkx:stylesheet" for the "href" parameter of the import...

Actually, I might just break the Oxygen build in favour of the Maven one: then there won't be a need to install the DocBook XSL package *or* use
system-dependent paths... Anyway the only build that actually works in Oxygen is the PDF one...
 