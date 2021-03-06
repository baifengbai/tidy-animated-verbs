source(here::here("R/00_base.R"))

y_extra <- bind_rows(y, data_frame(id = 2, y = "y5"))

# I manually linked objects together, it was late and this was easier...
anim_df <- tibble::tribble(
  ~.y, ~label, ~value, ~.x, ~.id,    ~color, ~frame, ~obj,
  -1L,   "id",    "1",   1,  "x", "#E41A1C",      1,    1,
  -2L,   "id",    "2",   1,  "x", "#377EB8",      1,    2,
  -2L,   "id",    "2",   1,  "x", "#377EB8",      1,    3,
  -3L,   "id",    "3",   1,  "x", "#4DAF4A",      1,    4,
  -1L,    "x",   "x1",   2,  "x", "#d0d0d0",      1,    5,
  -2L,    "x",   "x2",   2,  "x", "#d0d0d0",      1,    6,
  -3L,    "x",   "x3",   2,  "x", "#d0d0d0",      1,    8,
  -2L,    "x",   "x2",   2,  "x", "#d0d0d0",      1,    7,
  -1L,   "id",    "1",   4,  "y", "#E41A1C",      1,    9,
  -2L,   "id",    "2",   4,  "y", "#377EB8",      1,    10,
  -3L,   "id",    "4",   4,  "y", "#984EA3",      1,    99,
  -4L,   "id",    "2",   4,  "y", "#377EB8",      1,    11,
  -1L,    "y",   "y1",   5,  "y", "#d0d0d0",      1,    12,
  -2L,    "y",   "y2",   5,  "y", "#d0d0d0",      1,    13,
  -3L,    "y",   "y4",   5,  "y", "#d0d0d0",      1,    98,
  -4L,    "y",   "y5",   5,  "y", "#d0d0d0",      1,    14,
  -1L,   "id",    "1",   2,  "x", "#E41A1C",      2,    1,
  -2L,   "id",    "2",   2,  "x", "#377EB8",      2,    2,
  -3L,   "id",    "2",   2,  "x", "#377EB8",      2,    3,
  -4L,   "id",    "3",   2,  "x", "#4DAF4A",      2,    4,
  -1L,    "x",   "x1",   3,  "x", "#d0d0d0",      2,    5,
  -2L,    "x",   "x2",   3,  "x", "#d0d0d0",      2,    6,
  -3L,    "x",   "x2",   3,  "x", "#d0d0d0",      2,    7,
  -4L,    "x",   "x3",   3,  "x", "#d0d0d0",      2,    8,
  -1L,    "y",   "y1",   4,  "x", "#d0d0d0",      2,    12,
  -2L,    "y",   "y2",   4,  "x", "#d0d0d0",      2,    13,
  -3L,    "y",   "y5",   4,  "x", "#d0d0d0",      2,    14,
  -1L,   "id",    "1",   2,  "y", "#E41A1C",      2,    9,
  -2L,   "id",    "2",   2,  "y", "#377EB8",      2,    10,
  -3L,   "id",    "2",   2,  "y", "#377EB8",      2,    11
)

lj_extra <- anim_df %>%
  arrange(obj, frame) %>%
  plot_data("left_join(x, y)") %>%
  animate_plot()

lj_extra <- animate(lj_extra)
anim_save(here::here("images", "left-join-extra.gif"), lj_extra)
