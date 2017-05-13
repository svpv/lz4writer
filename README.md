# lz4writer - a wrapper library for writing LZ4 files

* Since the [lz4frame library](https://github.com/lz4/lz4/blob/dev/lib/lz4frame.h)
  doesn't do IO on its own, it exposes many details such as pertaining to
  buffer management.  By contrast, this [lz4writer API](lz4writer.h) has been
  designed to be as simple as possible (see [the example](main.c)).

* The library can write the correct [Content Size field](https://github.com/lz4/lz4/wiki/lz4_Frame_format.md#frame-descriptor),
  even though the size isn't known in advance, by [rewriting the frame header](lz4fix.h).
  In order for this to work, the output must be seekable.  (The library can
  also write to a non-seekable descriptor without storing the Content Size field
  in the frame header.)

* The library can also write the [Content Checksum](https://github.com/lz4/lz4/wiki/lz4_Frame_format.md#general-structure-of-lz4-frame-format).
  Computing the checksum takes a little bit of time, though; files with the
  checksum are also slightly slower on decompression.

The lz4writer library is written by Alexey Tourbin.
The source code is provided under the MIT License.
