# Elm Dialog - A Modal Dialog Widget for Elm

Elm modal dialog boxes that fits in neatly with the Elm architecture.

## Aims

* ✓ Fit in neatly with the Elm architecture.
* ✓ Dialogs should have all the power of regular views.
* ✓ Dialogs should work equally well with sub-components and sub-sub-...-components.
* Dialogs should not rely on external CSS. (Not yet. Still relies on Bootstrap.)
* Dialogs should be optionally animated. (Not yet. It's straightforward but not documented/demo'd.)

## Examples


![Screenshot](screenshot.png?raw=true)

See the `examples/` directory for two fully-worked examples:

* `examples/Simple/App.elm` [(live demo)](http://krisajenkins.github.io/elm-dialog/Simple.html)
* `examples/Advanced/App.elm` [(live demo)](http://krisajenkins.github.io/elm-dialog/Advanced.html)

## Installation

From your top-level directory - the one with `elm-package.json` in - call:

```
$ elm package install krisajenkins/elm-dialog
```

## Usage

[See the Elm package for full usage docs](http://package.elm-lang.org/packages/krisajenkins/elm-dialog/latest/Dialog).

## Migration

### v3 to v4

v4 version added a `containerClass` field to the `Config` record. You can set
this to `containerClass = Nothing` until you need it.

## Building

```
make
```

...will run the whole build and test suite.

## Credits

Thanks to [Emilien Taque](https://github.com/etaque) for ideas & support.
Thanks to [Mike Onslow](https://github.com/mikeonslow) for the `containerClass`
feature.
## License

Copyright © 2016 Kris Jenkins

Distributed under the MIT license.
