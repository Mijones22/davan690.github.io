# export .r code only
# knitr::purl("./Davidson_2019_BeechForest.Rmd")

# render draft to webpage
# rmarkdown::render(input = "Davidson_2019_BeechForest.Rmd")
# ,
#                   output_format = "html_document",
#                   output_file = "Davidson_2019_t.html")

#render nb.html for webpage
#rmarkdown::render(input = "analysis/Davidson_2019_Simulation.Rmd", output_format = bookdown::word_document2(), output_dir = "_posts")

knitr::purl("02-Introduction.Rmd")

rmarkdown::render(input = "./02-Introduction.Rmd", output_format = bookdown::word_document2(), output_dir = "_posts")

#render nb.html for webpage
rmarkdown::render(input = "./_output.yml", output_format = bookdown::word_document2(), output_dir = "_posts")

# compareGroups::cGroupsGUI(mtcars)
# document global rules

## Boookdown package

bookdown::preview_chapter("02-Introduction.Rmd",
                          output_format = "bookdown::word_document2",
                          output_file = paste0("thesis-intro-", format(Sys.Date(), ("%d-%m-%y")), ".docx"),
                          output_dir = "chapter-previews"
                          # ,
                          # output_options = list(reference_docx = "word-style-ref.docx)"
                          )
rmarkdown::render("../index.Rmd",
                          output_format = "bookdown::word_document2",
                          output_file = paste0("thesis-intro-", format(Sys.Date(), ("%d-%m-%y")), ".docx"),
                          output_dir = "chapter-previews")
                          # ,
                          # output_options = list(reference_docx = "word-style-ref.docx)"
# )

rmarkdown::render(input = "03-Material-and-methods.Rmd", output_format = "word_document", output_dir = "chapter-previews")

bookdown::html_document2(input = "./index.Rmd")

####STARTIN AGAIN!!
# output:
#   bookdown::pdf_book:
#   base_format: rticles::jss_article

