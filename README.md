# epub-preview.yazi

[Yazi](https://github.com/sxyazi/yazi) plugin to preview `application/epub+zip` files

<details>
  <summary>Show case</summary>
  <img src="https://github.com/kirasok/epub-preview.yazi/assets/75790517/df829053-ceeb-409a-bd4d-175ca2e809af"/>
</details>

## Requirements

- [yazi](https://github.com/sxyazi/yazi)
- At least one of the following epub-thumbnailer command line tools:
  - [epub-thumbnailer](https://github.com/marianosimone/epub-thumbnailer), or
  - [gnome-epub-thumbnailer](https://gitlab.gnome.org/GNOME/gnome-epub-thumbnailer)
    (available as `gnome-epub-thumbnailer` package in Ubuntu and arch)

## Installation

### Linux/MacOS

```sh
git clone https://github.com/kirasok/epub-preview.yazi.git ~/.config/yazi/plugins/epub-preview.yazi
```

or with [`ya-pack`](https://yazi-rs.github.io/docs/cli/#package-manager)

```sh
ya pack -a kirasok/epub-preview
```

## Usage

Add this to your `yazi.toml`:

```toml
[[plugin.prepend_previewers]]
mime = "application/epub+zip"
run = "epub-preview"
```

## Troubleshooting when no preview is shown

- Make sure that the epub-thumbnailer is installed and available in your PATH. A command like this should work:

  ```bash
  gnome-epub-thumbnailer [something.epub] [output.png]
  ```

- Check your `yazi.toml`: If there is another previewer with zip file handling, epub-preview might be overwritten, e.g.: with the definition blow, `ouch` will run, not `epub-preview`:

  ```toml
  [[plugin.prepend_previewers]]
  mime = "application/*zip" 
  run = "ouch" 
  ```

- Check Yazi log file (see [yazi.rs](https://yazi-rs.github.io/docs/plugins/overview/#logging) where to find it)
