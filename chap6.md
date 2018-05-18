# 第 6 章 `Horizontal` and `Vertical` Mode
# Horizontal: 水平
# Vertical: 竖直/垂直
水平模式和竖直模式

在处理文件的任何时候，TeX 都处于某种状态。
At any point in its processing TEX is in some mode. 

共有六种模式，可划分为三类：
There are six modes, divided in three categories:

1. 水平模式和受限水平模式；
1. horizontal mode and `restricted` horizontal mode,
# restricted: limited in extent 限制

2. 竖直模式和内部竖直模式；和
2. vertical mode and `internal` vertical mode, and
# internal: 内置/内部

3. 数学模式和数学显示模式
3. math mode and display math mode.

数学模式将会在其他章节详细介绍(见 224 页)。
The math modes will be treated elsewhere (see page 224). 

这里我们首先关注水平和竖直模式，对象的类型会在相应的列表中出现，并且每个模式的命令都是专用的。
Here we shall look at the horizontal and vertical modes, the kinds of objects that can occur in the `corresponding` lists, and the commands that are `exclusive` for one mode or the other.
# corresponding: 相应/对应的
# exclusive: excluding or not admitting other things. 独占的

\ifhmode 用于测试当前模式是否为(受限)水平模式。
\ifhmode Test whether the current mode is (possibly restricted) horizontal mode.
\ifvmode 用于测试当前模式是否为(内部)竖直模式。
\ifvmode Test whether the current mode is (possibly internal) vertical mode.
\ifinner 用于测试当前模式是否为内部模式。
\ifinner Test whether the current mode is an internal mode.

\vadjust 指定用于在水平模式中闭合竖直列表的指定竖直符号。
\vadjust Specify vertical `material` for the enclosing vertical list while in horizontal mode.
# material: the matter from which a thing is or can be made. 材料/资料/素材

\showlists 将目前所有模式正在构建的部分列表的内容写入日志。
\showlists Write to the log file the contents of the `partial` lists currently being built in all modes.
# partial: existing only in part; incomplete. 局部的/部分的




## 6.1 Horizontal and vertical mode
水平模式和竖直模式

当不需要处理数学排版时，TeX 处于水平模式或竖直模式中，分别构建水平或竖直列表。
When not typesetting mathematics, TEX is in horizontal or vertical mode, building horizontal or vertical lists `respectively`. 
# respectively: separately or individually 分别

水平模式一般用来生成一行行的文字；
Horizontal mode is typically used to make lines of text; 

竖直模式则用来将一行行文字组成的段落堆到其他段落上。
vertical mode is typically used to `stack` the lines of a paragraph on top of each other. 
# stack: arrange (a number of things) in a pile, typically a neat one. 堆/叠

注意！这些模式和 TeX输入处理器的内部状态(见25页)并不相同。
Note that these modes are different from the internal states of TEX’s input processor (see page 25).




### 6.1.1 Horizontal mode
水平模式

水平模式的主要用来构建一行行的文字。
The main activity in horizontal mode is building lines of text. 

页面上的文字和\vbox or \vtop中的文字在水平模式中构建(这也许叫做“段落模式”)；
Text on the page and text in a \vbox or \vtop is built in horizontal mode (this might be called ‘paragraph mode’); 

如果\hbox 中仅仅有一行文字，则对应的模式为受限水平模式。
if the text is in an \hbox there is only one line of text, and the corresponding mode is the restricted horizontal mode.



在水平模式中，所有的材料都添加进了水平列表。
In horizontal mode all material is added to a horizontal list.

如果列表在非受限水平模式下构建，稍后它会被分解成行，然后添加进周围的竖直列表中。
If this list is built in unrestricted horizontal mode, it will later be broken into lines and added to the surrounding vertical list.

水平列表的每一个元素都是以下各项之一：
Each element of a horizontal list is one of the following:

\begin{itemize} 
\item 一个盒子(一个字符、合字、\cs{vrule} 或一个 \gr{box}))，
a box (a character, `ligature`, \cs{vrule},
or a \gr{box}),
\item 
a `discretionary` break,
\item 一个延迟操作(见第r~\ref{io}章)
a whatsit (see Chapter~\ref{io}),
# Whatsits: when are they used in practice? https://tex.stackexchange.com/questions/43152/whatsits-when-are-they-used-in-practice
\item 由 \cs{mark}, \cs{vadjust} 或 \cs{insert} 闭合的竖直材料，
vertical material enclosed in \cs{mark},
\cs{vadjust}, or \cs{insert},
\item 
\mdqon
活动铅空或目录连接符、铅空、断行惩罚或数学模式开/""关符号
glue or leaders, a kern, a penalty, or a math-on/""off item.
\mdqoff
\end{itemize}

最后一点的项目都是可丢弃的。
The items in the last point are all `discardable`. 

之所以称之为可丢弃项目，是因为在分解之后它们就消失了。
Discardable items are called that, because they disappear in a break. 

水平列表的分解会在19章讨论。
Breaking of horizontal lists is discussed in Chapter 19.




### 6.1.2 Vertical mode
竖直模式

竖直模式用于将一个项目堆到另一个上。
Vertical mode can be used to stack items on top of one another. 

大多数时候，这些项目是包含段落行的盒子。
Most of the time, these items are boxes containing the lines of paragraphs.



堆叠材料可以在竖直盒子内部进行，但这些堆起来的项目也可以在页面上单独出现。
Stacking material can take place inside a vertical box, but the items that are stacked can also appear by themselves on the page. 

后一种情况TeX将处于竖直模式中；而前一种位于一个竖直盒子内部，TeX会在内部竖直模式下操作。
In the `latter` case TEX is in vertical mode; in the former case, inside a vertical box, TEX operates in internal vertical mode.


在竖直模式中所有的材料都会加进竖直列表里。
In vertical mode all material is added to a vertical list. 

如果这个列表在内部竖直模式中构建，在页面生成时，它会被分解。
If this list is built in external vertical mode, it will later be broken when pages are formed.

竖直列表的每一个元素都是以下各项之一：
Each element of a vertical list is one of the following:

\begin{itemize}
\item 一个盒子(水平或竖直盒子或一个 \cs{hrule})
a box (a horizontal or vertical box or an \cs{hrule}),
\item 一个延迟操作
a whatsit,
\item 一个标记
a mark,
\item 活动铅空或目录连接符、铅空或断行惩罚。
glue or leaders, a kern, or a penalty.
\end{itemize}

列表最后一点中的项目都是可丢弃的。
The items in the last point are all discardable. 

竖直列表的断行将在第~\ref{page:break}章讨论。
Breaking of vertical lists is  discussed in Chapter 27.


在竖直列表的开始处有一些特殊条件需要注意：
There are a few `exceptional conditions` at the beginning of a vertical list:

\prevdepth 的值被设为 -1000pt。
the value of \prevdepth is set to -1000pt. 

此外，在内部竖直列表的顶端没有附加 \parskip 的可变铅空。
Furthermore, no \parskip glue is added at the top of an internal vertical list;

在主竖直列表的顶端(即“当前页”的顶端)没有附加可变铅空或其他可丢弃的项目，
\topskip 的可变铅空会在第一个盒子加入列表时加入(见第\ref{page:shape}和~\ref{page:break}章)。
at the top of the main vertical list (the top of the ‘current page’) no glue or other discardable items are added, and \topskip glue is added when the first box is placed on this list (see Chapters 26 and 27).



# 6.2 Horizontal and vertical commands
水平和竖直命令

有些命令本质上是“内在”水平或竖直的，如果有可能，它们会强制TEX进入该模式。
Some commands are so `intrinsically` horizontal or vertical in nature that they force TEX to go into that mode, if possible. 

能强制 TeX 进入水平模式的命令称作 ⟨horizontal command⟩；
A command that forces TEX into horizontal mode is called a ⟨horizontal command⟩; 

类似的能强制 TeX 进入竖直模式的命令称作 ⟨vertical command⟩。
similarly a command thatforces TEX into vertical mode is called a ⟨vertical command⟩.



但是，并非所有转换都是可行的：
However, not all transitions are possible: 

TeX 能从两种竖直模式切换到(无限制的)水平模式，并可以通过水平和竖直命令切换回去，
TEX can switch from both vertical modes to (unrestricted) horizontal mode and back through horizontal and vertical commands, 

但转入或转出受限水平模式的转换均是不可行的
but no transitions to or from restricted horizontal mode are possible 

(除了在竖直盒子内闭合水平盒子或使用其他的方式)。
(other than by enclosing horizontal boxes in vertical boxes or the otherway around). 

在受限水平模式内使用竖直命令会导致错误；
A vertical command in restricted horizontal mode thus gives anerror; 

受限水平模式内，\par命令没有效果。
the\parcommand in restricted horizontal mode has no effect.


以下是水平命令：
The horizontal commands are the following:

\label{h:com:list}
\begin{itemize}
\item 任何 \gr{letter}, \gr{otherchar}, \cs{char}，
由 \cs{chardef} 或 \cs{noboundary} 定义的控制序列；
any \gr{letter}, \gr{otherchar}, \cs{char}, 
a control sequence defined by \cs{chardef}, or \cs{noboundary};
\item \cs{accent}, \cs{discretionary}, 
软连词符 \verb|\-| 和 控制空格 \verb|\|\n{\char32}；
\cs{accent}, \cs{discretionary}, the discretionary
hyphen~\verb|\-| and control space~\verb|\|\n{\char32};
\item \cs{unhbox} 和 \cs{unhcopy};
\item \cs{vrule} 和 \gr{horizontal skip} 命令
\cs{hskip}, \cs{hfil}, \cs{hfill}, \cs{hss}, 和 \cs{hfilneg};
\item \cs{valign};
\item 数学位移 (\n\$)。
math shift (\n\$).
\end{itemize}

以下是 \cindextermbus{竖直}{命令}(\emph{vertical commands}):
\label{v:com:list}
\begin{itemize}
\item \cs{unvbox} 和 \cs{unvcopy};
\item \cs{hrule} 和 \gr{vertical skip} 命令
 \cs{vskip}, \cs{vfil}, \cs{vfill}, \cs{vss} 和 \cs{vfilneg};
\item \cs{halign};
\item \cs{end} 和 \cs{dump}.
\end{itemize}

注意！竖直命令不包含 \par；
Note that the vertical commands do not include\par; 

\cs{indent} 和 \cs{noindent} 也不是水平命令。
nor are\indentand\noindenthorizontal commands.

下方探讨了盒子和模式的联系；
The connection between boxes and modes is explored below; 

关于规则和模式的联系，详见第 \ref{rules} 章。
see Chapter9 for more on the connection between rules and modes




# 6.3 The internal modes
内部模式

受限水平模式是 \hbox 内部的水平模式的变种；而内部竖直模式是\vbox (or \vtop or \vcenter) 内部的竖直模式的变种。
The restricted horizontal mode and internal vertical mode are those variants of horizontal mode and vertical mode that hold inside an \hbox and \vbox (or \vtop or \vcenter) respectively. 

本质上说，受限水平模式相对于内部竖直模式限制更多。
However, restricted horizontal mode is rather more restricted in nature than internal vertical mode. 

第三种内内部模式是非显示的数学模式(见 章)
The third internal mode is non-display math mode (see Chapter 23).




# 6.3.1 Restricted horizontal mode
受限水平模式

对于水平模式，受限(\hbox的模式)与不受限(正在构建页面和竖直盒子中段落的模式)的最大区别是：你不能退出受限水平模式，而且 \par再这个模式中不起作用。
The main difference between restricted horizontal mode, the mode in an \hbox, and unrestricted horizontal mode, the mode in which paragraphs in vertical boxes and on the page are built, is that you cannot break out of restricted horizontal mode: \par does nothing in this mode. 

此外，受限水平模式中的 ⟨vertical command ⟩ 会导致错误。
Furthermore, a ⟨vertical command ⟩ in restricted horizontal mode gives an error. 

再非受限水平模式中，这样做会插入一个 \par 记号，并进入竖直模式(详见第 章)。
In unrestricted horizontal mode it would cause a \par token to be inserted and vertical mode to be entered (see also Chapter 17).





# 6.3.2 Internal vertical mode
内部竖直模式

内部竖直模式即 \vbox 内的竖直模式，很像构建页面时使用的外部竖直模式。
Internal vertical mode, the vertical mode inside a \vbox, is a lot like external vertical mode, the mode in which pages are built. 

内部竖直模式内的 ⟨horizontal command⟩ 是完全有效的，例如：TeX 开始以无限制水平模式构建段落。
A ⟨horizontal command⟩ in internal vertical mode, for instance, is perfectly valid: TEX then starts building a paragraph in unrestricted horizontal mode.


内部和外部竖直模式的一个区别是：在内部竖直模式中，\unskip 和 \unkern 命令没有效果，并且\lastbox 总是空的。
One difference is that the commands \unskip and \unkern have no effect in external vertical mode, and \lastbox is always empty in external vertical mode. 

详见第 \pageref{lastbox} 和 \pageref{unskip}。
See further pages 58 and 102.


输入的对齐在内部模式中处理(见第 章)。
The entries of alignments (see Chapter 25) are processed in internal modes: 

\halign 的项使用受限水平模式，而\valign的项使用内部垂直模式。
restricted horizontal mode for the entries of an \halign, and internal vertical mode for the entries of a \valign. 

\vadjust 的材料和\insert 的项也在内部竖直模式内处理；此外，TeX 在处理\output 记号序列时也会进入这个模式。
The material in \vadjust and \insert items is also processed in internal vertical mode; furthermore, TEX enters this mode when processing the \output token list.


\end 和 \dump 命令不允许出现在内部竖直模式中(后者仅存在于 IniTEX 中)
The commands \end and \dump (the latter exists only in IniTEX) are not allowed in internal vertical mode; 

此外  \dump 不允许在组内使用(见底 章)
furthermore, \dump is not allowed inside a group (see Chapter 33).





# 6.4 Boxes and modes

There are horizontal and vertical boxes, and there is horizontal and vertical mode. 

Not surprisingly, there is a connection between the boxes and the modes.

One can ask about this connection in two ways.




# 6.4.1 What box do you use in what mode?


This is the wrong question. Both horizontal and vertical boxes can be used in both horizontal and vertical mode. 

Their placement is determined by the prevailing mode at that moment.




# 6.4.2 What mode holds in what box?


This is the right question. When an \hbox starts, TEX is in restricted horizontal mode. 

Thus everything in a horizontal box is lined up horizontally.



When a \vbox is started, TEX is in internal vertical mode. Boxes of both kinds and other items are then stacked on top of each other.




# 6.4.3 Mode-dependent behaviour of boxes

Any ⟨box⟩ (see Chapter 5 for the full definition) can be used in horizontal, vertical, and math mode. 

Unboxing commands, however, are specific for horizontal or vertical mode. 

Both \unhbox and \unhcopy are ⟨horizontal command⟩s, so they can make TEX switch from vertical to horizontal mode; 

both \unvbox and \unvcopy are ⟨vertical command⟩s, so they can make TEX switch from horizontal to vertical mode.



In horizontal mode the \spacefactor is set to 1000 after a box has been placed. 

In vertical mode the \prevdepth is set to the depth of the box placed.

Neither statement holds for unboxing commands: after an \unhbox or \unhcopy the spacefactor is not altered, and after \unvbox or \unvcopy the \prevdepth remains unchanged. 

After all, these commands do not add a box, but a piece of a (horizontal or vertical) list.



The operations \raise and \lower can only be applied to a box in horizontal mode; 

similarly, \moveleft and \moveright can only be applied in vertical mode.




# 6.5 Modes and glue

Both in horizontal and vertical mode TEX can insert glue items the size of which is determined by the preceding object in the list.



For horizontal mode the amount of glue that is inserted for a space token depends on the \spacefactor of the previous object in the list. 

This is treated in Chapter 20.



In vertical mode TEX inserts glue to keep boxes at a certain distance from each other. 

This glue is influenced by the height of the current item and the depth of the previous one. 

The depth of items is recorded in the \prevdepth parameter (see Chapter 15).



The two quantities \prevdepth and \spacefactor use the same internal register of TEX. 

Thus the \prevdepth can be used or asked only in vertical mode, and the \spacefactor only in horizontal mode.