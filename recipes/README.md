# Build recipes

Pacscripts in this directory are **not** published packages. They exist so
`.github/workflows/build-debs.yml` can build a deb on a capable runner and
publish it as a GitHub release asset. `scripts/srcinfo.sh` only scans
`packages/`, and the srcinfo pre-commit hooks skip this directory, so nothing
here ends up in `packagelist` or `srclist`.

Layout:

```monospace
recipes/<name>/<name>.pacscript   # builds the deb, run by CI only
packages/<name>-deb/              # what users install, points at the release
```

To publish a new version:

1. Bump `pkgver`/`pkgrel` (and `sha256sums` of any new source) in the recipe.
2. Run the `build-debs` workflow with `recipe: <name>`.
3. The run summary prints the published deb's `sha256sums` and its measured
   `libc6` ABI floor; paste both into `packages/<name>-deb/<name>-deb.pacscript`
   (keep the URL in sync with `pkgver`/`pkgrel`).

Debs are built on Ubuntu 26.04 (`resolute`), so the published artifact needs a
glibc at least as new as the floor the workflow reports. Do not rebuild the
same `pkgver`/`pkgrel`: the pinned sha256 would no longer match.

The workflow uses `pacstall -B`, so the artifact is byte-for-byte what a local
`pacstall -I` would produce, including maintscripts and conffiles.
