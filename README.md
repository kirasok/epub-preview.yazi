# epub-preview.yazi

[Yazi](https://github.com/sxyazi/yazi) plugin to preview `application/epub+zip` files

## Requirements

- [yazi](https://github.com/sxyazi/yazi)
- [epub-thumbnailer](https://github.com/marianosimone/epub-thumbnailer)

## Installation

### Linux/MacOS

```sh
git clone https://github.com/kirasok/epub-preview.yazi.git ~/.config/yazi/plugins/epub-preview.yazi
```

## Usage

Add this to your `yazi.toml`:

```toml
[[plugin.prepend_previewers]]
mime = "application/epub+zip"
run = "epub-preview"
```
