---

layout: post
title: "UP-loading data to `gdrive`"
subtitle: "A possibly redundant option"
image: /img/tools.jpg
permlink: /first-post.html
tags: ["website", "overview", "general"]
bigimg: /img/tools.jpg
use-site-title: true

---

## Upload to production steps

```{r prod-upload, echo = TRUE, message = TRUE, warning = TRUE}```

```googledrive::drive_auth()```

```locate the folder```

```gdrive_prod_folder <- googledrive::as_id(params$gdrive_folder_url)```

### clean it out    

```gdrls <- googledrive::drive_ls(gdrive_prod_folder)```

```if (nrow(gdrls) > 0) {    dplyr::pull(gdrls, id) %>%    purrr::walk(~googledrive::drive_rm(googledrive::as_id(.x)))    }# upload ```

```newlist.files(here::here("prod/charts"), recursive = TRUE, full.names = TRUE) %>%purrr::walk(googledrive::drive_upload, path = gdrive_prod_folder)```

