## **类MIPS单周期微处理器设计**

### 项目简介

利用HDL语言，基于Xilinx FPGA nexys4实验 平台，设计的能够执行以下MIPS指令集的
单周期类MIPS处理器

– 支持基本的内存操作如lw，sw指令 

– 支持基本的算术逻辑运算如add，sub，and， or，slt，andi指令

– 支持基本的程序控制如beq，j指令

### 项目依赖

- Xilinx_ISE 14.7

[关于Xilinx_ISE 14.7在Win10下崩溃闪退的兼容性问题解决](https://sherwinww.github.io/2019/03/19/20190319-ISEcrash/)

### 项目使用

- 下载源码至本地（**路径不能包含中文字符**）
  - [release界面](https://github.com/sherwinww/SingleCycleCPU/releases)下载压缩包自行解压
  - 或者通过git clone至本地

- 用ISE打开工程

![](https://i.loli.net/2019/05/23/5ce62dc6f0b0410863.png)

- 双击instrROM更改指令集为你的个人指令集（coe文件）

![](https://i.loli.net/2019/05/23/5ce62e8f4a3b477920.png)

![](https://i.loli.net/2019/05/23/5ce62f247dea133602.png)

- 通过仿真查看结果

### 原理图示

![](https://i.loli.net/2019/05/23/5ce62a070ef5186906.png)

### 各模块设计

源码见

- 指令寄存器（instrRAM）

新建 ROM类型的存储器，为单一输出指令的存储器。用 IP Core 建立指令存储器模块，对外接口为 clk、存储器地址输入信号（指令指针）以及数据输出信号（指令），分 配 128 个字的存储空间，字长为 32 位宽。配置 ROM内存空间的初始化 COE 文件。

- 内存寄存器（dataRAM）

新建 RAM类型的存储器，并且需要独立的读写控制信号。用 IP Core 建立指令存储器模块，对外输入接口为 clk、we、datain、addr；对外输出接口为 dataout。分配 64 个 字存储空间，字长为 32 位宽。

- 寄存器（regFILE）
- 主控制器（mainCtr）

控制器的输入为指令的 opCode 字段（6 位操作码）。操作码经过控制器单元的译码，给各个模块输出正确的控制信号。

![](https://i.loli.net/2019/05/23/5ce62b8f30caf90587.png)

- ALU控制器(ALUCtr)

ALU控制需要通过控制码和功能码来区分指令。lw、sw、addi、beq 为 I 型指令，前三条指令需要 ALU 完成加运算，beq 指令需要 ALU 完成减运算，因此可分为两类；add，sub， and，or，slt 为 R 型指令分别完成加、减、与、或、小于设置 5 种不同的操作，但它们可以 通过功能码来区分，因此归为一类。所以可以用 2 位控制码加上 6 位功能码产生 4 位 ALU控制信号。

![](https://i.loli.net/2019/05/23/5ce62baf68f0979869.png)

- ALU逻辑计算器(ALU)

微处理器支持的 add、sub、and、or、slt、andi 运算指令，需要 ALU单元实现运算；sw、lw 数据传送指令需要 ALU 单元计算存储器地址；beq、j 跳转指令需要 ALU 来比较两个寄存 器是否相等。所有这些指令包含操作为加、减、与、或、小于设置 5 种不同的操作。因此用 输入 4 位控制信号来控制 ALU完成运算。 对外输入接口为 input1（第一操作数）、input2（第二操作数）、aluCtr（ALU模块控制信号）；对外输出接口为 aluRes（ALU模块运算结果）、zero（结果是否为 0 的标志）。

![](https://i.loli.net/2019/05/23/5ce62bc6136eb92061.png)

- 符号位扩展（Signext）
- 顶层模块（top）

### 参考书籍

- 《计算机组成原理与接口技术——基于MIPS架构》
- 《计算机组成原理与接口技术——基于MIPS架构实验教程》（第二版）