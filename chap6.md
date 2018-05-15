# 第 6 章 Horizontal and Vertical Mode
# Horizontal: 水平
# Vertical: 竖直/垂直
水平模式和竖直模式

在处理文件的任何时候，TeX 都处于某种状态。
At any point in its processing TEX is in some mode. 

共有六种模式，可划分为三类：
There are six modes, divided in three categories:

1. 水平模式和受限水平模式；
1. horizontal mode and restricted horizontal mode,
# restricted: limited in extent 限制

2. 竖直模式和内部垂直模式；和
2. vertical mode and internal vertical mode, and
# internal: 内置/内部

3. 数学模式和数学显示模式
3. math mode and display math mode.

数学模式将会在其他章节详细介绍(见 224 页)。
The math modes will be treated elsewhere (see page 224). 

这里我们首先关注水平和竖直模式，对象的类型会在相应的列表中出现，并且每个模式的命令都是专用的。
Here we shall look at the horizontal and vertical modes, the kinds of objects that can occur in the corresponding lists, and the commands that are exclusive for one mode or the other.
# corresponding: 相应/对应的
# exclusive: excluding or not admitting other things. 独占的

\ifhmode 用于测试当前模式是否为(限制)水平模式。
\ifhmode Test whether the current mode is (possibly restricted) horizontal mode.
\ifvmode 用于测试当前模式是否为(内部)竖直模式。
\ifvmode Test whether the current mode is (possibly internal) vertical mode.
\ifinner 用于测试当前模式是否为内部模式。
\ifinner Test whether the current mode is an internal mode.
\vadjust 指定用于在水平模式中闭合竖直列表的指定竖直符号。
\vadjust Specify vertical material for the enclosing vertical list while in horizontal mode.
# material: the matter from which a thing is or can be made. 材料/资料/素材
\showlists 将目前所有模式正在构建的部分列表的内容写入日志。
\showlists Write to the log file the contents of the partial lists currently being built in all modes.
# partial: existing only in part; incomplete. 局部的/部分的



## 6.1 Horizontal and vertical mode
水平模式和竖直模式


When not typesetting mathematics, TEX is in horizontal or vertical mode, building horizontal or vertical lists respectively. 

Horizontal mode is typically used to make lines of text; vertical mode is typically used to stack the lines of a paragraph on top of each other. 

Note that these modes are different from the internal states of TEX’s input processor (see page 25).




### 6.1.1 Horizontal mode
水平模式


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
竖直模式


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
