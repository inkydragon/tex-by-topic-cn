# 第 6 章 Horizontal and Vertical Mode

At any point in its processing TEX is in some mode. There are six modes, divided in three categories:

1. horizontal mode and restricted horizontal mode,
2. vertical mode and internal vertical mode, and
3. math mode and display math mode.

The math modes will be treated elsewhere (see page 224). 

Here we shall look at the horizontal and vertical modes, the kinds of objects that can occur in the corresponding lists, and the commands that are exclusive for one mode or the other.


\ifhmode Test whether the current mode is (possibly restricted) horizontal mode.
\ifvmode Test whether the current mode is (possibly internal) vertical mode.
\ifinner Test whether the current mode is an internal mode.
\vadjust Specify vertical material for the enclosing vertical list while in horizontal mode.
\showlists Write to the log file the contents of the partial lists currently being built in all modes.




## 6.1 Horizontal and vertical mode

When not typesetting mathematics, TEX is in horizontal or vertical mode, building horizontal or vertical lists respectively. 

Horizontal mode is typically used to make lines of text; vertical mode is typically used to stack the lines of a paragraph on top of each other. 

Note that these modes are different from the internal states of TEX’s input processor (see page 25).




### 6.1.1 Horizontal mode

The main activity in horizontal mode is building lines of text. 

Text on the page and text in a \vbox or \vtop is built in horizontal mode (this might be called ‘paragraph mode’); 

if the text is in an \hbox there is only one line of text, and the corresponding mode is the restricted horizontal mode.




In horizontal mode all material is added to a horizontal list.

If this list is built in unrestricted horizontal mode, it will later be broken into lines and added to the surrounding vertical list.

Each element of a horizontal list is one of the following:

• a box (a character, ligature, \vrule, or a ⟨box⟩),
• a discretionary break,
• a whatsit (see Chapter 30),
• vertical material enclosed in \mark, \vadjust, or \insert,
• glue or leaders, a kern, a penalty, or a math-on/off item.

The items in the last point are all discardable. 

Discardable items are called that, because they disappear in a break. 

Breaking of horizontal lists is discussed in Chapter 19.




### 6.1.2 Vertical mode

Vertical mode can be used to stack items on top of one another. 

Most of the time, these items are boxes containing the lines of paragraphs.




Stacking material can take place inside a vertical box, but the items that are stacked can also appear by themselves on the page. 

In the latter case TEX is in vertical mode; in the former case, inside a vertical box, TEX operates in internal vertical mode.



In vertical mode all material is added to a vertical list. If this list is built in external vertical mode, it will later be broken when pages are formed.

Each element of a vertical list is one of the following:

• a box (a horizontal or vertical box or an \hrule),
• a whatsit,
• a mark,
• glue or leaders, a kern, or a penalty.

The items in the last point are all discardable. 

Breaking of vertical lists is 6.2 Horizontal and vertical commands 75 discussed in Chapter 27.



There are a few exceptional conditions at the beginning of a vertical list:

the value of \prevdepth is set to -1000pt. 

Furthermore, no \parskip glue is added at the top of an internal vertical list;

at the top of the main vertical list (the top of the ‘current page’) no glue or other discardable items are added, and \topskip glue is added when the first box is placed on this list (see Chapters 26 and 27).
