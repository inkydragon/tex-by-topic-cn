# 第 31 章 Allocation
寄存器分配

\TeX\ 的寄存器是数字类型的
TEX has registers of a number of types. 

对于其中的一些寄存器，我们可以使用显式的命令定义某个特定寄存器的别名。
For some of these, `explicit` commands exist to define a `synonym` for a certain register; 
# explicit: stated clearly and in detail 明确的、显式
# synonym: a word that means exactly or nearly the same as another word 代名词、同义词、别名

在普通格式中，所有类型的寄存器都可以通过对应的宏来分配一个未使用的寄存器。
for all of them `macros` exist in the plain format to `allocate` an unused register. 
# macros: 宏
# allocate: 分配

本章主要关注别名定义和寄存器分配命令。对于宏编写者，我们讨论了一些关于寄存器分配的方针。
This chapter treats the `synonym` and `allocation` commands, and discusses some `guidelines` for macro writers `regarding` allocation.
# allocation: 分配
# guidelines: a general rule 方针
# regarding: in respect of 关于

 定义了一个 寄存器的别名。
\countdef Define a `synonym` for a \count `register`.
\dimendef Define a synonym for a \dimen register.
\muskipdef Define a synonym for a \muskip register.
\skipdef Define a synonym for a \skip register.
\toksdef Define a synonym for a \toks register.

 分配了一个未使用的 寄存器。
\newbox `Allocate` an unused \box register.
\newcount Allocate an unused \count register.
\newdimen Allocate an unused \dimen register.

\newfam Allocate an unused `math family`.
\newinsert Allocate an unused `insertion class`.
\newlanguage (TEX3 only) Allocate a new `language number`.

\newmuskip Allocate an unused \muskip register.
\newskip Allocate an unused \skip register.
\newtoks Allocate an unused \toks register.
\newread Allocate an unused input stream.
\newwrite Allocate an unused output stream.





## 31.1 Allocation commands
寄存器分配命令

在plain TEX中，定义了宏\new用于分配寄存器。
In plain TEX, \new... macros are defined for allocation of registers. 

TEX的寄存器可以根据分配方式的不同而分为两类。这一点在下面会谈到。
The registers of TEX `fall into` two classes that are allocated in different ways. This is treated below. 
# fall into: 落入、分成

plain TEX 的 \newlanguage宏并不会分配任何的寄存器。
The \newlanguage macro of plain TEX does not allocate any register. 

相反的，它只是从0开始，分配了一个数字。
Instead it merely assigns a number, starting from 0. 

TeX 3 最多有256种断字组合模式。
TEX (version 3) can have at most 256 different sets of `hyphenation` patterns. 
# hyphenation: 断字

plain TEX 的 \new.宏被定义为 \outer (精确定义详见chap11)，\outer 避免了在其他宏中使用分配宏。
The \new... macros of plain TEX are defined to be \outer (see Chapter 11 for a `precise` explanation), which `precludes` use of the allocation macros in other macros. 
# precise；精确的
# precludes: prevent from happening 排除、避免

因此，LaTeX 在重定义这些宏时没有带上\outer 前缀。
Therefore the LATEX format `redefines` these macros without the \outer prefix. 
# redefines: 重新定义、重定义



### 31.1.1 \count, \dimen, \skip, \muskip, \toks

对于这些寄存器，存在一个⟨registerdef⟩命令。举个例子：\countdef 将寄存器与特定的控制序列组合在一起：
For these registers there exists a ⟨registerdef⟩ command, for instance \countdef, to couple a specific register to a control sequence: 

> ⟨registerdef⟩⟨control sequence⟩⟨equals⟩⟨8-bit number⟩

在定义之后
After the definition 

> \countdef\MyCount=42 

分配的寄存器可以这样使用：
the allocated register can be used as 

> \MyCount=314

或者
or

> \vskip\MyCount\baselineskip

⟨registerdef⟩ 命令用在\newcount等plain 宏中，它能分配一个未使用的寄存器；在以下命令之后
The ⟨registerdef⟩ commands are used in plain TEX macros \newcount `et` `cetera` that allocate an unused register; after
# et cetera: indicate that further 等等

> \newcount\MyCount

  就可以完全按照上述两个例子那样使用。
\MyCount can be used exactly as in the above two examples.




### 31.1.2 \box, \fam, \write, \read, \insert

For these registers there exists no ⟨registerdef⟩ command in TEX, so \chardef is used to allocate box registers in the `corresponding` plain TEX macros \newbox, for instance.
# corresponding: 相应、对应的

The fact that \chardef is used implies that the defined control sequence does not stand for the register itself, but only for its number. Thus after

> \newbox\MyBox

it is necessary to write

> \box\MyBox

Leaving out the \box means that the character in the current font with number \MyBox is `typeset`. 
# typeset: 排字

The \chardef command is `treated further in` Chapter 3.
# treated further: 进一步处理



## 31.2 Ground rules for macro writers

The \new... macros of plain TEX have been designed to form a `foundation` for macro packages, such that several of such packages can operate without `collisions` in the same run of TEX. 
# foundation: 基础
# collisions: 碰撞、冲突

In appendix B of the TEX book Knuth `formulates` some ground rules that macro writers should adhere to.
# formulates: 制定、规定

1. The \new... macros do not allocate registers with numbers 0–9. 

These can therefore be used as `‘scratch’` registers. However, as any macro family can use them, no assumption can be made about the `permanency` of their contents. 
# ‘scratch’: 草稿的
# permanency: 永久性

Results that are to be passed from one call to another should
`reside` in `specifically` allocated registers.
# reside: have one's permanent home in a particular place 处于
# specifically: 特别的

Note that count registers 0–9 are used for page `identification` in the dvi file (see Chapter 33), so no global `assignments` to these should be made.
# identification: 识别、
# assignments: 分配、指派

2. \count255, \dimen255, and \skip255 are also available. 

This is because inserts are allocated from 254 `downward` and, together with an `insertion` box, a count, dimen, and skip register, all with the same number, are allocated.
# downward: 向下
# insertion: 插入、嵌入

Since \box255 is used by the output routine (see Chapter 28), the count, dimen, and skip with number 255 are freely available.


3. Assignments to `scratch` registers 0, 2, 4, 6, 8, and 255 should be local; 
# scratch:

assignments to registers 1, 3, 5, 7, 9 should be \global (with the exception of the \count registers). 

This guideline prevents ‘save stack build-up’ (see Chapter 35).


任何寄存器都能在组内使用，TeX的分组机制会在组外保存它的值。
4. Any register can be used inside a group, as TEX’s grouping `mechanism` will restore its value outside the group. 
# mechanism: 机制

使用这种寄存器有两个条件：
There are two conditions on this use of a register: 

没有对它进行全局赋值，并且
no global assignments should be made to it, and it must not be possible that other macros may be activated in that group that perform global assignments to that register.

5.在更长的时间周期内使用或者在不同宏的调用之间必须存活的寄存器应该由新的...分配。
5. Registers that are used over longer `periods` of time, or that have to survive in between calls of different macros, should be allocated by \new....
# periods: 时间、时期