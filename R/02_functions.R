proc_data <- function(x, .id = "x") {
  colors <- scales::brewer_pal(type = "qual", "Set1")(max(x$id))
  x %>%
    mutate(.y = -row_number()) %>%
    tidyr::gather("label", "value", -.y) %>%
    mutate(value = as.character(value)) %>%
    group_by(.y) %>%
    mutate(
      .x = 1:n(),
      .id = .id,
      color = ifelse(label == "id", value, max(x$id) + 1),
      color = colors[as.integer(color)],
      color = ifelse(is.na(color), "#d0d0d0", color),
      color = ifelse(is.na(value), "#ffffff", color)
    )
}

plot_data <- function(x, title = "") {
  ggplot(x) +
    aes(.x, .y, fill = color, label = value) +
    geom_tile(color = "white", size = 3) +
    geom_text(aes(x = .x), hjust = 0.5, size = 12, family = "Fira Sans", color = "white") +
    scale_fill_identity() +
    coord_equal() +
    ggtitle(title) +
    theme_void() +
    theme(plot.title = element_text(family = "Fira Mono", hjust = 0.5, size = 24)) +
    guides(fill = FALSE)
}

animate_plot <- function(x) {
  x +
    transition_states(frame, transition_length = 2, state_length = 1) +
    enter_fade() +
    exit_fade() +
    ease_aes("sine-in-out")
}
options(tidy_verb_anim.functions_loaded = TRUE)
