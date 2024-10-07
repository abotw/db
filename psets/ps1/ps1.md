---
title: Problem Set 1
layout: home
parent: Problem Sets
---

# Problem Set 1
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Q1: 电子商务管理系统

某电子商务公司需要上线网上**电子商务管理系统**，委托你进行用户需求分析，并完成以下两方面工作。

1. 根据用户需求分析找出实体和联系，画出对应的 E-R 图，并根据题意编写属性（关键属性加下划线），其中基本的需求分析可知为：可随时查询库存中现有**物品**的名称、数量和单价，所有物品均应由**物品编号**唯一标识；可随时查询**顾客**订货情况，包括顾客号、顾客名、所订物品编号、订购数量、联系方式、交货地点，所有顾客编号不重复；当需要时，可通过数据库中保存的供应商名称、电话、邮编与地址信息向相应**供应商**订货，一个编号货物只由1个供应商供货。（20分）
2. 将该 E-R 模型转换为一组等价的**关系模式 (P21)**，并标出各关系模式的主码。（15分）

**SOLUTION**

根据电子商务管理系统的需求描述，经分析，实体和联系如下：

**实体**

- 物品：物品ID；物品名称；物品单价；物品数量；供应商ID
- 顾客：顾客ID；顾客名称；顾客电话；顾客地址
- 供应商：供应商ID；供应商名称；供应商电话；供应商邮编；供应商地址

**联系**

- 订购：订购ID；顾客ID；物品ID；订购数量
- 供应：物品ID；供应商ID

关系模式如下，主码用粗体标出：

- 物品（**物品ID**，物品名称，物品单价，物品数量，供应商ID）
- 顾客（**顾客ID**，顾客名称，顾客电话，顾客地址）
- 供应商（**供应商ID**，供应商名称，供应商电话，供应商邮编，供应商地址）
- 订购（**订购ID**，顾客ID，物品ID，订购数量）
- 供应（**物品ID，供应商ID**）

## Q2: 设备销售信息管理系统

某设备销售企业需要上线设备销售信息管理系统，委托你进行用户需求分析，并完成以下两方面工作。
1. 根据用户需求分析找出实体和联系，画出对应的E-R图，并根据题意编写属性（关键属性加下划线），其中基本的需求分析可知为：每种设备都可以销售给多个客户，每个客户都可以购买多种设备且都要登记购买数量；一个部门（每一个部门有一个部门经理）可以管理多种设备，一种设备仅由一个部门来调动管理。（20分）
2. 将该E-R模型转换为一组等价的关系模式，并标出各关系模式的主码。（15分）

**SOLUTION**

根据设备销售企业销售信息管理系统的需求描述，经分析，实体和联系如下：

**实体**

设备：设备ID；设备名称；设备数量
客户：客户ID；客户名称
部门：部门ID；部门名称；部门经理

**联系**

购买：购买ID；客户ID；设备ID；购买数量
管理：部门ID；设备ID

**E-R图**

在E-R图中，实体用矩形表示，联系用菱形表示，属性用椭圆形表示，主键属性用下划线标出，实体和联系之间用线条连接，外键依赖关系标注在联系的相应实体上。

**关系模式**

- 设备（**设备ID**，设备名称，设备数量）
- 客户（**客户ID**，客户名称）
- 部门（**部门ID**，部门名称，部门经理）
- 购买（**购买ID**，客户ID，设备ID，购买数量）
- 管理（**部门ID，设备ID**）

## Q3: 生产运营信息管理系统

某生产企业需要上线生产运营信息管理系统，委托办公室人员小李与你对接，小李在调研企业的内组织（若干分厂、设备处和职能部门）的基础上向你提供了实体及其组成要素，并绘制了简易的局部 E-R 图。

小李提供的实体及其组成要素：

- 部门：部门号、部门名称、地址、电话
- 职员：职工编号、职员名、性别、职务、出生日期
- 设备处：单位号、地址、电话
- 工人：工人编号、姓名、性别、年龄
- 设备：设备号、名称、规格、价格
- 零件：零件号、名称、规格、价格
- 分厂：分厂号、名称、地址、电话

小李绘制的局部E-R图：（30分）

![ps1-1.png](ps1-1.png)

现委托你继续完善需求分析工作，
1. 给出实体命名和属性命名冲突的解决思路，
2. 并绘制全局E-R图。

在继续完善生产运营信息管理系统的需求分析时，首先需要解决实体命名和属性命名冲突的问题，然后绘制全局的E-R图。

**SOLUTION 1**

1. 不同的实体应该有唯一的名字，这样，即使不同实体的某个属性名称相同，由于它们分属于不同的实体，便可以通过实体区分出它们是不同的属性；
2. 可以在属性名前添加实体前缀，使其含义更加明确，能有效避免命名冲突；
3. 如果某些属性具有相同的含义，则可以考虑将这些属性抽象出来，独立成一个单独的实体，从而避免命名冲突的情况。

**SOLUTION 2**

绘制全局 E-R 图如下：

根据小李提供的信息和我们对需求的分析，实体与联系关系可以总结如下：

- 部门：部门ID；部门名称；部门地址；部门电话
- 职员：职工ID；职员名称；职工性别；职工职务；出生日期
- 设备处：单位ID；地址；电话
- 工人：工人编号；姓名；性别；年龄
- 设备：设备号；名称；规格；价格
- 零件：零件号；名称；规格；价格
- 分厂：分厂号；名称；地址；电话

#### 实体：
1. **部门（Department）**：
   - 部门号（Department_ID，主键）
   - 部门名称（Department_Name）
   - 地址（Department_Address）
   - 电话（Department_Phone）

2. **职员（Staff）**：
   - 职工编号（Staff_ID，主键）
   - 职员名（Staff_Name）
   - 性别（Gender）
   - 职务（Position）
   - 出生日期（Date_of_Birth）
   - 部门号（Department_ID，外键）

3. **设备处（Equipment_Office）**：
   - 单位号（Office_ID，主键）
   - 地址（Office_Address）
   - 电话（Office_Phone）

4. **工人（Worker）**：
   - 工人编号（Worker_ID，主键）
   - 姓名（Worker_Name）
   - 性别（Gender）
   - 年龄（Age）
   - 分厂号（Branch_ID，外键）

5. **设备（Device）**：
   - 设备号（Device_ID，主键）
   - 名称（Device_Name）
   - 规格（Device_Specification）
   - 价格（Device_Price）
   - 设备处单位号（Office_ID，外键）

6. **零件（Part）**：
   - 零件号（Part_ID，主键）
   - 名称（Part_Name）
   - 规格（Part_Specification）
   - 价格（Part_Price）

7. **分厂（Branch）**：
   - 分厂号（Branch_ID，主键）
   - 名称（Branch_Name）
   - 地址（Branch_Address）
   - 电话（Branch_Phone）

#### 联系：
1. **部门-职员**：
   - 一个部门可以有多个职员，职员隶属于一个部门（1对多的关系）。
   
2. **分厂-工人**：
   - 一个分厂可以有多个工人，工人隶属于一个分厂（1对多的关系）。
   
3. **设备处-设备**：
   - 一个设备处可以管理多个设备，设备隶属于一个设备处（1对多的关系）。

4. **设备-零件**：
   - 设备和零件之间可能存在多对多的关系，一个设备可以使用多个零件，一个零件可以应用于多个设备（多对多的关系）。需要一个中间表来存储这种关系，比如**设备零件关联表（Device_Part_Relation）**，包含设备号和零件号。

#### 全局E-R图：
- **实体**：部门、职员、设备处、工人、设备、零件、分厂
- **联系**：部门管理职员，分厂雇佣工人，设备处管理设备，设备和零件之间有多对多关系

通过这些实体和联系，完整的全局E-R图可以将公司内各个实体和它们之间的业务关联进行全面建模。

---

Last Updated: Sun Oct  6 15:21:22 CST 2024