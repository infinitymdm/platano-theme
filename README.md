### Platano-theme

*Oro parece; Plata no es.*


> **Note:**
> This theme is currently a work in progress, and is not ready for
> general use.

Platano is a GTK theme based on Material Design principles. It's
intended as a continuation of the wonderful 
[Plata-theme by tista500](https://gitlab.com/tista500/plata-theme).

What's in a name?
-----------------

The name Platano comes from a wonderful Spanish riddle I was taught
several years ago, which appears at the top of this page:

> *Oro parece; plata no es. ¿Que es?*

Roughly translated:

> *It looks like gold; silver (plata) it is not. What is it?*

Translating doesn't help much though, as the answer is hidden within
the riddle:

> *plata no es*

The answer? [Un Plátano](https://en.wikipedia.org/wiki/Cooking_banana)!

Just like the "punch line" of this short riddle states, Plata this is
not. This is Platano!

----------------------------------------------

Typography
----------

Platano strongly depends on Material Design resources, especially its **fonts**.

 1. [**Roboto**](https://fonts.google.com/specimen/Roboto)
   - Very famous as the default truetype font in Android (English ver.).
   - Multilingual support is not good.
   - Weight used in Platano: 300, 400, 500, 700

| |Primary|Fallback|
|:-----|:-----:|:-----:|
|Gnome-Shell =< 3.34|**Roboto**|Sans-serif|
|Gnome-Shell >= 3.36|follow system settings||
|Cinnamon   |**Roboto**|Sans-serif|

Platano is designed with nominal **13px (or 14px)** Roboto Regular font.
In Gnome, "window-scaling-factor = 1.0" means `-gtk-dpi = 96`, it also means:
  ```
  13 [px] x 72 [pt/inch] / 96 [px/inch] = 9.75 [pt]
  14 [px] x 72 [pt/inch] / 96 [px/inch] = 10.5 [pt]
  ```
That's the reason why `13.33px = 10pt` is used for rem/px conversion in Gtk 3.2x/4.0 theming.

> **Note:**
>
> NotoSans CJK (ChineseJapaneseKorean) opentype fonts are actually **0.1em taller than Roboto fonts**, so if 10pt Roboto was suitable on your LCDs, set 9pt for NotoSans CJK families.

**Verify the fonts are rendered correctly via font-viewer tools like Gnome-Font-Viewer.**

Installation
------------

Platano is not yet ready for use. Watch this repository for release announcements!

In the meantime, if you'd like to test things, here are some basic build instructions:

1. Make sure you have the Meson build system and `sassc` installed.
    - Note that `sassc` will be replaced by a more modern sass compiler at some point in the future.
2. Open a terminal and clone the repository. Navigate into the newly cloned folder.
3. `mkdir build && cd build`
4. `meson configure`. I'd suggest looking over the options as well, and making sure everything is to your liking.
5. `ninja build`
6. `ninja install`
7. If you want to theme libadwaita apps as well, copy `path/to/installed/themes/Platano<-variant>/gtk-4.0/gtk.css` to `~/.config/gtk-4.0/gtk.css`. 
7. You should be all set up now. Enjoy!


Public License
--------------
 * GPLv2.0 (Codebase)
 * CC BY-SA 4.0 (Asset images)

 > **Note:**
 >
 > [**Paper Icons**](http://snwh.org/paper/icons) by Sam Hewitt is licensed under CC-SA-4.0.

Special Thanks
--------------

 * Tista500 for their work on Plata-theme
 * The [Buddies of Budgie](https://github.com/BuddiesOfBudgie) folks who taught me about tools for theme development