/****** Object:  Table [dbo].[Car_TypeInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_TypeInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CTDate] [datetime] NULL,
	[UnitID] [int] NULL,
	[CarType] [int] NULL,
	[CarCount] [int] NULL,
 CONSTRAINT [PK_Car_TypeInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car_StayInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_StayInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NOT NULL,
	[CarNo] [varchar](10) NOT NULL,
	[CarNoPre] [varchar](10) NULL,
	[EnterTime] [datetime] NULL,
	[LeaveTime] [datetime] NULL,
	[StayTime] [int] NULL,
 CONSTRAINT [PK_Car_StayInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_SaveTemp]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_SaveTemp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [varchar](100) NULL,
	[CarNo] [varchar](10) NULL,
	[PassTime] [datetime] NULL,
	[CarColor] [int] NULL,
	[CarType] [int] NULL,
	[CarDirection] [int] NULL,
	[CarImg] [varchar](100) NULL,
	[DataTime] [datetime] NULL,
 CONSTRAINT [PK_Car_SaveTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_PassInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_PassInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NOT NULL,
	[DeviceID] [int] NULL,
	[CarNo] [varchar](10) NULL,
	[PassTime] [datetime] NULL,
	[DataTime] [datetime] NULL,
	[CarColor] [int] NULL,
	[CarType] [int] NULL,
	[CarDirection] [int] NULL,
	[CarImg] [varchar](100) NULL,
 CONSTRAINT [PK_Car_PassInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_LogInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_LogInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProcTime] [datetime] NULL,
	[ProcCount] [int] NULL,
	[ErrorCount] [int] NULL,
 CONSTRAINT [PK_Car_LogInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car_Info]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_Info](
	[CarNo] [varchar](10) NOT NULL,
	[CarColor] [int] NULL,
	[CarType] [int] NULL,
	[CarFlag] [varchar](100) NULL,
	[AreaCode] [varchar](100) NULL,
	[CarNoPre] [varchar](10) NULL,
 CONSTRAINT [PK_Car_Info] PRIMARY KEY CLUSTERED 
(
	[CarNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_FiveMinute]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_FiveMinute](
	[rTime] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Car_FiveMinute] PRIMARY KEY CLUSTERED 
(
	[rTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_ErrorInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_ErrorInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [varchar](100) NULL,
	[CarNo] [varchar](10) NULL,
	[PassTime] [datetime] NULL,
	[CarColor] [int] NULL,
	[CarType] [int] NULL,
	[CarDirection] [int] NULL,
	[CarImg] [varchar](100) NULL,
	[DataTime] [datetime] NULL,
	[ProcTime] [datetime] NULL,
	[ErrorMsg] [text] NULL,
 CONSTRAINT [PK_Car_ErrorInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_EmployeeStayInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_EmployeeStayInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NULL,
	[CarNo] [varchar](10) NOT NULL,
	[CarNoPre] [varchar](10) NULL,
	[EnterTime] [datetime] NULL,
	[LeaveTime] [datetime] NULL,
	[StayTime] [int] NULL,
 CONSTRAINT [PK_Car_EmployeeStayInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_EmployeePassInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_EmployeePassInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NOT NULL,
	[DeviceID] [int] NULL,
	[CarNo] [varchar](10) NULL,
	[PassTime] [datetime] NULL,
	[DataTime] [datetime] NULL,
	[CarColor] [int] NULL,
	[CarType] [int] NULL,
	[CarDirection] [int] NULL,
	[CarImg] [varchar](100) NULL,
 CONSTRAINT [PK_Car_EmployeePassInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_EmployeeNo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_EmployeeNo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NOT NULL,
	[CarNo] [varchar](10) NOT NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_Car_EmployeeNo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_EmployeeCurrInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_EmployeeCurrInfo](
	[CarNo] [varchar](10) NOT NULL,
	[UnitID] [int] NOT NULL,
	[CarNoPre] [varchar](10) NULL,
	[EnterTime] [datetime] NULL,
 CONSTRAINT [PK_Car_EmployeeCurrInfo] PRIMARY KEY CLUSTERED 
(
	[CarNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_DeviceCount]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_DeviceCount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dTime] [datetime] NULL,
	[UnitID] [int] NULL,
	[DeviceID] [int] NULL,
	[EnterCount] [int] NULL,
	[LeaveCount] [int] NULL,
 CONSTRAINT [PK_Car_DeviceCount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car_CurrInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_CurrInfo](
	[UnitID] [int] NULL,
	[CarNo] [varchar](10) NOT NULL,
	[CarNoPre] [varchar](10) NULL,
	[EnterTime] [datetime] NULL,
 CONSTRAINT [PK_Car_CurrInfo] PRIMARY KEY CLUSTERED 
(
	[CarNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_ComeFrom]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car_ComeFrom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CFDate] [datetime] NULL,
	[UnitID] [int] NULL,
	[CarNoPre] [varchar](10) NULL,
	[CarCount] [int] NULL,
 CONSTRAINT [PK_Car_ComeFrom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car_ChangeInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_ChangeInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NOT NULL,
	[rTime] [datetime] NULL,
	[CurrCount] [int] NULL,
	[EnterCount] [int] NULL,
	[LeaveCount] [int] NULL,
 CONSTRAINT [PK_Car_ChangeInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_CurrInfo_Clear]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Car_CurrInfo_Clear]
As
Begin
  --清理各种数据！
  Select GETDATE()
End
GO
/****** Object:  Table [dbo].[Unit_Relate]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit_Relate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NULL,
	[PreUnitID] [int] NULL,
	[rDate] [datetime] NULL,
	[rCount] [int] NULL,
 CONSTRAINT [PK_Unit_Relate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_UserInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_UserInfo](
	[UserName] [varchar](100) NOT NULL,
	[TrueName] [varchar](100) NULL,
	[Pwd] [varchar](100) NULL,
	[UnitID] [int] NULL,
	[LastLoginTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_UnitInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_UnitInfo](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [varchar](20) NULL,
	[UnitType] [int] NOT NULL,
	[pUnitID] [int] NOT NULL,
	[Lat] [varchar](20) NULL,
	[Lnt] [varchar](20) NULL,
	[PassTime] [int] NULL,
	[CarMaxCount] [int] NULL,
	[CarClearTime] [varchar](20) NULL,
	[DeleteFlag] [int] NULL,
	[CarNoPre] [varchar](10) NULL,
 CONSTRAINT [PK_Sys_UnitInfo] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_DeviceInfo]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_DeviceInfo](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [varchar](100) NULL,
	[DeviceKind] [varchar](100) NULL,
	[DeviceInstall] [varchar](100) NULL,
	[IPAddress] [varchar](20) NULL,
	[UnitID] [int] NOT NULL,
	[DeviceArc] [int] NOT NULL,
	[LeaveUnitID] [int] NULL,
 CONSTRAINT [PK_Sys_DeviceInfo] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_CarPlace]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_CarPlace](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AreaCode] [varchar](100) NULL,
	[Province] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[CarNoPre] [varchar](10) NULL,
	[ProvinceShort] [varchar](10) NULL,
	[Lat] [varchar](20) NULL,
	[Lon] [varchar](20) NULL,
 CONSTRAINT [PK_Sys_CarAddress] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stat_Date]    Script Date: 04/09/2016 14:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stat_Date](
	[SDate] [int] NOT NULL,
 CONSTRAINT [PK_Stat_Date] PRIMARY KEY CLUSTERED 
(
	[SDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fun_UnitInfo_GetByUnitID]    Script Date: 04/09/2016 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[fun_UnitInfo_GetByUnitID]
(@UnitID int)
returns @UnitInfo table(UnitID int,UnitType Int)
As
Begin
  Insert Into @UnitInfo 
  Select UnitID,UnitType From Sys_UnitInfo Where UnitID  = @UnitID
  while (@@ROWCOUNT >0)
  Begin
  Insert Into @UnitInfo 
    Select UnitID,UnitType
    From Sys_UnitInfo Where PUnitID in (Select UnitID From @UnitInfo)
		And UnitID not in (Select UnitID From @UnitInfo)
  end
  return 
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_TypeInfo_Save]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_TypeInfo_Save]
(
  @CarType int,
  @UnitID int,
  @PassTime DateTime
)
As
Begin
	--写入到当前进入车辆的归属地！
	  
	  if Exists (Select * From Car_TypeInfo Where UnitID = @UnitID And CTDate = @PassTime And CarType = @CarType)
	  Begin
	    UpDate Car_TypeInfo Set CarCount = CarCount + 1 
	    Where UnitID = @UnitID And CTDate = @PassTime And CarType = @CarType
	  End
	  Else
	  Begin
		Insert Into Car_TypeInfo (CTDate,UnitID,CarType,CarCount)
		Values (@PassTime,@UnitID,@CarType,1)
	  End
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_SaveTemp_Save]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_SaveTemp_Save]
(
  @DeviceName varchar(100),
  @CarNo varchar(10),
  @PassTime datetime,
  @CarColor int,
  @CarType int,
  @CarDirection int,
  @CarImg varchar(100)
)
As
Begin
  insert into Car_SaveTemp (DeviceName,CarNo,PassTime,CarColor,CarType,CarDirection,CarImg,DataTime)
    values (@DeviceName,@CarNo,@PassTime,@CarColor,@CarType,@CarDirection,@CarImg,GETDATE())
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_Car_PassInfo_Page]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Stat_Car_PassInfo_Page]  
(  
  @PageCount int,  
  @BeginDate DateTime,  
  @EndDate DateTime,
  @CarNo varchar(10)  
)  
As  
Begin  
  Select COUNT(*)   
  from Car_PassInfo   
  where PassTime Between @BeginDate And @EndDate and CarNo like @CarNo   
  
    
  Select Top 20 a.ID,A.CarNo,A.DeviceID,B.CarColor,B.CarType,C.Province,C.City,A.CarDirection,  
  A.CarImg,A.PassTime  
  from Car_PassInfo A,Car_Info B,Sys_CarPlace C  
  where A.CarNO = B.CarNo And A.PassTime Between @BeginDate And @EndDate and a.CarNo like @CarNo  
 And B.AreaCode = C.AreaCode And B.CarNoPre = C.CarNoPre  
  And A.ID not in (Select top (20 * (@PageCount - 1)) ID  
  From Car_PassInfo  
  Where PassTime Between @BeginDate And @EndDate and CarNo like @CarNo Order by PassTime Desc)  
  Order by PassTime Desc  
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_Car_PassInfo_ByCarNo]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Stat_Car_PassInfo_ByCarNo]
(
  @BeginDate DateTime,
  @EndDate DateTime,
  @CarNo VarChar(10),
  @UnitID int
)
As
Begin
  Select A.CarNo,A.DeviceID,B.CarColor,B.CarType,C.Province,C.City,A.CarDirection,
  A.CarImg,A.PassTime
  from Car_PassInfo A,Car_Info B,Sys_CarPlace C
  where A.CarNO = B.CarNo And A.PassTime Between @BeginDate And @EndDate
	And B.AreaCode = C.AreaCode And B.CarNoPre = C.CarNoPre
	And A.CarNo= @CarNo And A.UnitID = @UnitID
  Order by PassTime Desc
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_Car_PassInfo]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Stat_Car_PassInfo]
(
  @BeginDate DateTime,
  @EndDate DateTime
)
As
Begin
  Select A.CarNo,A.DeviceID,B.CarColor,B.CarType,C.Province,C.City,A.CarDirection,
  A.CarImg,A.PassTime
  from Car_PassInfo A,Car_Info B,Sys_CarPlace C
  where A.CarNO = B.CarNo And A.PassTime Between @BeginDate And @EndDate
	And B.AreaCode = C.AreaCode And B.CarNoPre = C.CarNoPre
  Order by PassTime Desc
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_ComeFrom_Save]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_ComeFrom_Save]
(
  @CarNoPre VarChar(10),
  @UnitID int,
  @PassTime DateTime
)
As
Begin
	--写入到当前进入车辆的归属地！
	  
	  if Exists (Select * From Car_ComeFrom Where UnitID = @UnitID And CFDate = @PassTime And CarNoPre = @CarNoPre)
	  Begin
	    UpDate Car_ComeFrom Set CarCount = CarCount + 1 
	    Where UnitID = @UnitID And CFDate = @PassTime And CarNoPre = @CarNoPre
	  End
	  Else
	  Begin
		Insert Into Car_ComeFrom (CFDate,UnitID,CarNoPre,CarCount)
		Values (@PassTime,@UnitID,@CarNoPre,1)
	  End
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_ChangeInfo_Leave]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_ChangeInfo_Leave]
(
  @UnitID int,
  @PassTime DateTime,
  @Add bit
)
As
Begin
  Declare @SaveTime datetime
  Declare @CurrMin int,@SaveMin int,@pTime DateTime
  Select @ptime = CONVERT(VarChar(16),@PassTime,120)
  Select @CurrMin = DatePart(n,@ptime),@SaveMin = datepart(n,@ptime) / 5 * 5  
  Select @SaveTime = DATEADD(n,@SaveMin - @CurrMin ,@ptime)
  if Exists (Select * From Car_ChangeInfo Where UnitID = @UnitID And rTime = @SaveTime)
  Begin
    if (@Add = 1)
    Begin
      update Car_ChangeInfo 
      Set 
		LeaveCount = LeaveCount + 1 
	  Where UnitID = @UnitID And rTime = @SaveTime 
    End
    Else
    Begin
      update Car_ChangeInfo 
      Set 
		CurrCount = CurrCount - 1,
		EnterCount = EnterCount - 1
      Where UnitID = @UnitID And rTime = @SaveTime 
    End
  End
  Else
  Begin
    if (@Add = 1)
    Begin
      Insert Into Car_ChangeInfo (UnitID,rTime,CurrCount,EnterCount,LeaveCount)
      Values (@UnitID,@SaveTime,0,0,1)
    End
  End
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_ChangeInfo_Enter]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_ChangeInfo_Enter]
(
  @UnitID int,
  @PassTime DateTime
)
As
Begin
  Declare @SaveTime datetime
  Declare @CurrMin int,@SaveMin int,@pTime DateTime
  Select @ptime = CONVERT(VarChar(16),@PassTime,120)
  Select @CurrMin = DatePart(n,@ptime),@SaveMin = datepart(n,@ptime) / 5 * 5  
  Select @SaveTime = DATEADD(n,@SaveMin - @CurrMin ,@ptime)
  if Exists (Select * From Car_ChangeInfo Where UnitID = @UnitID And rTime = @SaveTime)
  Begin
    update Car_ChangeInfo Set EnterCount = EnterCount + 1 Where UnitID = @UnitID And rTime = @SaveTime 
  End
  Else
  Begin
    Insert Into Car_ChangeInfo (UnitID,rTime,CurrCount,EnterCount,LeaveCount)
    Values (@UnitID,@SaveTime,0,1,0)
  End
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_ChangeInfo_Current]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_ChangeInfo_Current]
(
  @UnitID int,
  @PassTime DateTime
)
As
Begin
  Declare @SaveTime datetime
  Declare @CurrMin int,@SaveMin int,@pTime DateTime
  Select @ptime = CONVERT(VarChar(16),@PassTime,120)
  Select @CurrMin = DatePart(n,@ptime),@SaveMin = datepart(n,@ptime) / 5 * 5  
  Select @SaveTime = DATEADD(n,@SaveMin - @CurrMin ,@ptime)
  if Exists (Select * From Car_ChangeInfo Where UnitID = @UnitID And rTime = @SaveTime)
  Begin
    update Car_ChangeInfo Set CurrCount = CurrCount + 1,EnterCount = EnterCount + 1 
    Where UnitID = @UnitID And rTime = @SaveTime 
  End
  Else
  Begin
    Insert Into Car_ChangeInfo (UnitID,rTime,CurrCount,EnterCount,LeaveCount)
    Values (@UnitID,@SaveTime,1,1,0)
  End
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_ChangeInfo_CurrCount_UpDate]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Car_ChangeInfo_CurrCount_UpDate]
As  
Begin
  
  Declare @CurrTime datetime,@SaveTime datetime
    
  Select @CurrTime = Convert(DateTime,Convert(VarChar(16),GETDATE(),120))
  Declare @CurrMin int,@SaveMin int  
    
  Select @CurrMin = DatePart(n,@CurrTime),@SaveMin = datepart(n,@CurrTime) / 5 * 5  
  Select @SaveTime = DATEADD(n,@SaveMin - @CurrMin ,@CurrTime)  
  
  Select UnitID,CurrCount = Count(*) Into #TempCurrInfo From Car_CurrInfo Group By UnitID
  UpDate Car_ChangeInfo 
  Set CurrCount = B.CurrCount
  From Car_ChangeInfo A,#TempCurrInfo B
  Where A.UnitID = B.UnitID And A.rTime = @SaveTime
  
  Insert Into Car_ChangeInfo (UnitID,rTime,CurrCount,EnterCount,LeaveCount)
  Select UnitID,@SaveTime,CurrCount,0,0
  From #TempCurrInfo 
  Where UnitID not in (Select UnitID From Car_ChangeInfo Where rTime = @SaveTime)
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_Info_Save]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Car_Info_Save]
(
  @CarNo VarChar(10),
  @CarNoPre VarChar(10),
  @CarColor Int,
  @CarType int
)
As
Begin
  if not Exists (Select * from Car_Info Where CarNo = @CarNo)
  Begin
      Declare @AreaCode VarChar(10)
	  Select @AreaCode = AreaCode From Sys_CarPlace Where CarNoPre = @CarNoPre
	  if (@AreaCode is null)
	  Begin
		Declare @ProvinceShort VarChar(10),@City VarChar(100),@Province VarChar(100)
		Declare @Lon VarChar(20),@Lat Varchar(20)
	    
		Select @ProvinceShort = LEFT(@CarNoPre,1)
		Select @AreaCode = AreaCode,@City = City,@Province = Province,
			@Lon = Lon,@Lat = Lat
		From Sys_CarPlace Where ProvinceShort = @ProvinceShort
		if (@AreaCode is null)
		begin
		  Select @AreaCode = '000000'
		  Insert Into Sys_CarPlace (AreaCode,Province,City,CarNoPre,ProvinceShort,Lon,Lat)
			Values (@AreaCode,'未知','未知',@CarNoPre,'无',null,null)
		end
		Else
		Begin
		  Insert Into Sys_CarPlace (AreaCode,Province,City,CarNoPre,ProvinceShort,Lon,Lat)
			Values (@AreaCode,@Province,@City,@CarNoPre,@ProvinceShort,@Lon,@Lat)
		End
	  End
	  insert into Car_Info (CarNo,CarColor,CarType,AreaCode,CarFlag,CarNoPre)
      values (@CarNo,@CarColor,@CarType,@AreaCode,null,@CarNoPre)
  End
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_ErrorInfo_Save]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_ErrorInfo_Save]
(
  @DeviceName varchar(100),
  @CarNo varchar(10),
  @PassTime datetime,
  @CarColor int,
  @CarType int,
  @CarDirection int,
  @CarImg varchar(100),
  @DataTime datetime,
  @ErrorMsg Text,
  @ErrorCount Int output
)
As
Begin
  Insert Into Car_ErrorInfo (DeviceName,CarNo,PassTime,CarColor,CarType,CarDirection,CarImg,DataTime,ProcTime,ErrorMsg)
    Values (@DeviceName,@CarNo ,@PassTime,@CarColor,@CarType,@CarDirection,@CarImg,@DataTime,GETDATE(),@ErrorMsg)
  Select @ErrorCount = @ErrorCount + 1
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_EmployeePassInfo_Save]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_EmployeePassInfo_Save]
(
  @CarNo varchar(10),
  @PassTime datetime,  
  @DataTime datetime,  
  @CarColor int,  
  @CarType int,  
  @CarDirection int,
  @CarImg varchar(100),
  @UnitID int,
  @DeviceID int
)
As
Begin
  --员工车辆，写入员工表中
  insert into Car_EmployeePassInfo (UnitID,DeviceID,CarNo,PassTime,DataTime,CarColor,CarType,CarDirection,CarImg)
    Values (@UnitID,@DeviceID,@CarNo,@PassTime,@DataTime,@CarColor,@CarType,@CarDirection,@CarImg)
  --判断是否为离开？
  if (@CarDirection = 0)
	begin
	  --进入
	  if Exists (Select * from Car_EmployeeCurrInfo Where CarNo = @CarNo)
	  Begin
	    --已经存在，则更新时间，抛弃掉前一个时间？
	    UpDate Car_EmployeeCurrInfo Set EnterTime = @PassTime,UnitID = @UnitID Where CarNo = @CarNo
	  End
	  Else
	  Begin
	    Insert Into Car_EmployeeCurrInfo (CarNo,UnitID,CarNoPre,EnterTime)
			Values (@CarNo,@UnitID,Left(@CarNo,2),@PassTime)
	  End
	end
	else
	begin
	  --离开
	  if Exists (Select * From Car_EmployeeCurrInfo Where CarNo = @CarNo And UnitID = @UnitID)
	  Begin
	    Insert into Car_EmployeeStayInfo (UnitID,CarNo,CarNoPre,EnterTime,LeaveTime,StayTime)
	      Select @UnitID,CarNo,CarNoPre,EnterTime,@PassTime,DATEDIFF(N,EnterTime,@PassTime)
	      From Car_EmployeeCurrInfo Where CarNo = @CarNo
	  End
	  Delete Car_EmployeeCurrInfo Where CarNo = @CarNo
	  --如果没有进入记录，则不用处理！
	end
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_EmployeePassInfo_GeByCarNo]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_EmployeePassInfo_GeByCarNo]
(
  @UnitID int,
  @CarNo VarChar(10),
  @BeginDate Datetime,
  @EndDate DateTime
)
as
begin
  Select * 
  From Car_EmployeePassInfo 
  Where CarNo = @CarNo And UnitID = @UnitID
  and PassTime Between @BeginDate And @EndDate
  order by PassTime desc
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_EmployeeNO_Remove]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_EmployeeNO_Remove]
(
  @UnitID int,
  @CarNo VarChar(10)
)
As
Begin
  insert into Car_CurrInfo (UnitID,CarNo,CarNoPre,EnterTime)
  Select UnitID,CarNo,CarNoPre,EnterTime
  From Car_EmployeeCurrInfo
  Where CarNo = @CarNo And UnitID = @UnitID
  Delete Car_EmployeeCurrInfo Where CarNo = @CarNo And UnitID = @UnitID
  
  insert into Car_PassInfo (UnitID,DeviceID,CarNo,PassTime,DataTime,CarColor,CarType,CarDirection,CarImg)
	Select UnitID,DeviceID,CarNo,PassTime,DataTime,CarColor,CarType,CarDirection,CarImg
	From Car_EmployeePassInfo 
	Where CarNo = @CarNo And UnitID = @UnitID
  Delete Car_EmployeePassInfo Where CarNo = @CarNo And UnitID = @UnitID
  
  insert into Car_StayInfo (UnitID,CarNo,CarNoPre,EnterTime,LeaveTime,StayTime)
  Select UnitID,CarNo,CarNoPre,EnterTime,LeaveTime,StayTime
  From Car_EmployeeStayInfo Where CarNo = @CarNo And UnitID = @UnitID
  
  Delete Car_EmployeeStayInfo Where CarNo = @CarNo And UnitID = @UnitID
  
  Delete Car_EmployeeNo where CarNo = @CarNo And UnitID = @UnitID
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_EmployeeNo_GetByUnitID]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Car_EmployeeNo_GetByUnitID]
(
  @UnitID int
)
As
Begin
  Select CarNo 
  From Car_EmployeeNo 
  Where UnitID = @UnitID
  Order By AddTime Desc
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_EmployeeNo_Add]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Car_EmployeeNo_Add]
(
  @UnitID int,
  @CarNo VarChar(10)
)
as
begin
  if Exists (Select * From Car_EmployeeNo Where CarNo = @CarNo And UnitID = @UnitID)
  Begin
    Select 'F','已经存在的车牌号'
    return
  end
  insert into Car_EmployeeCurrInfo (UnitID,CarNo,CarNoPre,EnterTime)
	Select UnitID,CarNo,CarNoPre,EnterTime
	From Car_CurrInfo
	where CarNo = @CarNo And UnitID = @UnitID
  Delete Car_CurrInfo where CarNo = @CarNo And UnitID = @UnitID
	
  insert into Car_EmployeePassInfo (UnitID,DeviceID,CarNo,PassTime,DataTime,CarColor,CarType,CarDirection,CarImg)  
 Select UnitID,DeviceID,CarNo,PassTime,DataTime,CarColor,CarType,CarDirection,CarImg  
 From Car_PassInfo Where CarNo = @CarNo And UnitID = @UnitID
  Delete Car_PassInfo Where CarNo = @CarNo And UnitID = @UnitID 
    
  insert into Car_EmployeeStayInfo (UnitID,CarNo,CarNoPre,EnterTime,LeaveTime,StayTime)  
  Select UnitID,CarNo,CarNoPre,EnterTime,LeaveTime,StayTime  
  From Car_StayInfo Where CarNo = @CarNo And UnitID = @UnitID
    
  Delete Car_StayInfo Where CarNo = @CarNo And UnitID = @UnitID 
    
  insert into Car_EmployeeNo (UnitID,CarNo,AddTime) values (@UnitID,@CarNo,GetDate())
End
GO
/****** Object:  StoredProcedure [dbo].[usp_WelCome_Mobile]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_WelCome_Mobile]  
As  
Begin  
  --当前车辆数量
  Select COUNT(*) as CurrCount,
  CONVERT(decimal(10,1), AVG(DATEDIFF(N,EnterTime,GetDate()) * 1.0 / 60)) as StayTime 
  From Car_CurrInfo  
  Declare @CurrDate DateTime  
  Select @CurrDate = CONVERT(DateTime,CONVERT(VarChar(10),GetDate(),120))  
  --进入车辆总数  
    
  Select SUM(CarCount) As EnterCount   
  From Car_ChangeInfo   
  Where ChangeType = 1   
 and rTime > @CurrDate  
  --离开车辆总数  
  Select SUM(CarCount) As LeaveCount   
  From Car_ChangeInfo   
  Where ChangeType = 2  
 and rTime > @CurrDate  
  --5分钟变化情况  
  Select A.rtime,CarCount,ChangeType  
  From Car_FiveMinute A  
 Left outer join Car_ChangeInfo B   
 on Convert(Datetime,(@CurrDate + ' ' + a.rtime)) = b.rTime and B.rTime >= @CurrDate  
  Order By A.rTime  
    
  --当前车辆来源(全部的车辆情况)  
  Select Top 10  C.City,COUNT(A.CarNo) As CityCount  
  From Car_CurrInfo A,Car_Info B,Sys_CarPlace C  
  Where A.CarNo = B.CarNo And B.AreaCode = C.AreaCode And A.CarNoPre = C.CarNoPre  
  Group By C.City  
  Order by CityCount
  --车型比例  
  Select CarType,COUNT(*) As TypeCount  
  From Car_CurrInfo A,Car_Info B  
  Where A.CarNo = B.CarNo  
  Group By CarType  
    
  --迁徙图（外省的车辆来源地）  
  --今日外省的市?  
  Select Top 10 B.City,B.Lon,B.Lat,COUNT(*) As MCount  
  From  
  (  
  Select CarNo,CarNoPre  
  From Car_StayInfo  
  Where EnterTime > @CurrDate  
  Union  
  Select CarNo,CarNoPre  
  From Car_CurrInfo) A   
  Inner Join Sys_CarPlace B on A.CarNoPre = B.CarNoPre And B.AreaCode not like '33%'  
  Group By B.City,B.Lon,B.Lat  
  Order by MCount
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Unit_Relate_Save]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Unit_Relate_Save]
(
  @CarNo VarChar(10),
  @UnitID int
)
As
Begin
  Declare @PreUnitID int,@LeaveTime DateTime
  --上一次到的不同景区！
	      Select Top 1 @PreUnitID = UnitID,@LeaveTime = LeaveTime
	      from Car_StayInfo 
	      Where CarNo = @CarNo And UnitID <> @UnitID 
	      Order By LeaveTime Desc
	      
	      --能找到，并且在最近3天之内去过的景点，认为是有关联的
	      if (@PreUnitID Is not null And DATEDIFF(D,@LeaveTime,GETDATE()) < 3)
	      Begin
	        Declare @CurrDate Datetime
	        Select @CurrDate = CONVERT(VarChar(10),GetDate(),120)
	        if Exists (Select * From Unit_Relate Where UnitID = @UnitID And PreUnitID = @PreUnitID And rDate = @CurrDate)
	        begin
				Insert Into Unit_Relate (UnitID,PreUnitID,rDate,rCount)
				Values (@UnitID,@PreUnitID,@CurrDate,1)
			end
			else
			begin
				Update Unit_Relate Set rCount = rCount + 1 
				Where UnitID = @UnitID And PreUnitID = @PreUnitID And rDate = @CurrDate
			end
	      End
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UserInfo_Save]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Sys_UserInfo_Save]
(
  @UserName varchar(100),
  @TrueName varchar(100),
  @UnitID int
)
As
Begin
  if not exists(select * from sys_userinfo where username = @UserName)
  Begin
    insert into Sys_UserInfo (UserName,TrueName,Pwd,UnitID,LastLoginTime)
      values (@UserName,@TrueName,'1111',@UnitID,null)
  End
  Else
  Begin
    update Sys_UserInfo 
        set 
         TrueName = @TrueName,
         UnitID = @UnitID
        where UserName = @UserName
  End
  Select 'T'
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UserInfo_RePwd]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_UserInfo_RePwd]
(
  @UserName varchar(100)
)
as
begin
  update sys_userinfo set pwd = '1111' where username = @UserName
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UserInfo_ModifyPwd]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_UserInfo_ModifyPwd]  
(  
  @UserName varchar(50),  
  @OldPwd VarChar(50),  
  @NewPwd VarChar(50)  
)  
as  
begin  
  if not Exists (Select * From Sys_UserInfo Where UserName = @UserName And Pwd = @OldPwd)  
  Begin  
    Select 'F','密码错误'  
    Return  
  End  
  Else  
  Begin  
    UpDate Sys_UserInfo Set Pwd = @NewPwd Where UserName = @UserName  
  End  
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UserInfo_Login]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Sys_UserInfo_Login]
(
  @UserName VarChar(100),
  @Pwd varChar(100)
)
As
Begin
  update Sys_UserInfo set LastLoginTime = GetDate() Where UserName = @UserName And Pwd = @Pwd
  Select A.UserName,A.TrueName,IsNull(B.UnitID,0) as UnitID,ISNULL(B.UnitType,0) As UnitType,B.UnitName
  From Sys_UserInfo a
  left outer join Sys_UnitInfo b on a.UnitID = B.UnitID and deleteflag = 0
  Where UserName = @UserName And Pwd = @Pwd
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UserInfo_GetByUserName]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_UserInfo_GetByUserName]
(
  @UserName varchar(100)
)
As
begin
  Select * From Sys_UserInfo Where UserName = @UserName
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UserInfo_GetByUnitID]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_UserInfo_GetByUnitID]
(
  @UnitID int
)
as
begin
  Select *
  From Sys_UserInfo
  Where UnitID = @UnitID
  
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UserInfo_Delete]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_UserInfo_Delete] 
(
  @UserName varchar(100)
)
As
Begin
  Delete Sys_UserInfo Where UserName = @UserName
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UnitInfo_Save]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Sys_UnitInfo_Save]
(
  @UnitID int,
  @UnitName varchar(20),
  @CarNoPre VarChar(10),
  @UnitType int,
  @pUnitID int,
  @Lat varchar(20),
  @Lnt varchar(20),
  @PassTime int,
  @CarMaxCount int,
  @CarClearTime varchar(20)
)
As
Begin
  if (@UnitID = 0)
  Begin
    insert into Sys_UnitInfo (UnitName,CarNoPre,UnitType,pUnitID,Lat,Lnt,PassTime,CarMaxCount,CarClearTime,DeleteFlag)
      values (@UnitName,@CarNoPre,@UnitType,@pUnitID,@Lat,@Lnt,@PassTime,@CarMaxCount,@CarClearTime,0)
  End
  Else
  Begin
    update Sys_UnitInfo 
        set 
         UnitName = @UnitName,
         CarNoPre = @CarNoPre,
         UnitType = @UnitType,
         pUnitID = @pUnitID,
         Lat = @Lat,
         Lnt = @Lnt,
         PassTime = @PassTime,
         CarMaxCount = @CarMaxCount,
         CarClearTime = @CarClearTime
        where UnitID = @UnitID
  End
  Select 'T'
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UnitInfo_GetOtherSenic]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Sys_UnitInfo_GetOtherSenic]
(
  @UnitID int
)
as
Begin
  Select * 
  From Sys_UnitInfo 
  Where pUnitID in (Select pUnitID From Sys_UnitInfo Where UnitID = @UnitID)
  And UnitID <> @UnitID And UnitType = 0
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UnitInfo_GetByUnitID]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_UnitInfo_GetByUnitID]
(
  @UnitID int
)
as
begin
  Select * From Sys_UnitInfo Where UnitID = @UnitID
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UnitInfo_GetALL]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Sys_UnitInfo_GetALL]
As
Begin
  Select * from Sys_UnitInfo where deleteflag = 0
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_UnitInfo_Delete]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_UnitInfo_Delete]
(
  @UnitID int
)
as
begin
  if Exists (Select * From Sys_UnitInfo Where pUnitID = @UnitID And DeleteFlag = 0)
  Begin
    Select 'F','还有下级单位，不能删除'
    Return
  End
  UpDate Sys_UnitInfo Set DeleteFlag = 1 Where UnitID = @UnitID
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_DeviceInfo_Save]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Sys_DeviceInfo_Save]
(
  @DeviceID int,
  @DeviceName VarChar(100),
  @DeviceKind varchar(100),
  @DeviceArc int,
  @DeviceInstall varchar(100),
  @IPAddress varchar(20),
  @UnitID int,
  @LeaveUnitID int
)
As
Begin
  if (@DeviceID is null)
  Begin
    insert into Sys_DeviceInfo (DeviceName,DeviceKind,DeviceArc,DeviceInstall,IPAddress,UnitID,LeaveUnitID)
      values (@DeviceName,@DeviceKind,@DeviceArc,@DeviceInstall,@IPAddress,@UnitID,@LeaveUnitID)
  End
  Else
  Begin
    update Sys_DeviceInfo 
        set 
         DeviceName = @DeviceName,
         DeviceKind = @DeviceKind,
         DeviceArc = @DeviceArc,
         DeviceInstall = @DeviceInstall,
         IPAddress = @IPAddress,
         UnitID = @UnitID,
         LeaveUnitID = @LeaveUnitID
        where DeviceID = @DeviceID
  End
  Select 'T'
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_DeviceInfo_GetByUnitID]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_DeviceInfo_GetByUnitID]
(
  @UnitID int
)
as
begin
  Select * From Sys_DeviceInfo Where UnitID = @UnitID
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_DeviceInfo_GetByDeviceName]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Sys_DeviceInfo_GetByDeviceName]
(
  @DeviceName VarChar(100)
)
as
begin
  Select A.*,B.PassTime
  From Sys_DeviceInfo A,Sys_UnitInfo B
  Where A.UnitID = B.UnitID And DeviceName = @DeviceName 
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_DeviceInfo_GetByDeviceID]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_DeviceInfo_GetByDeviceID]
(
  @DeviceID varchar(100)
)
As
begin
  Select * From Sys_DeviceInfo Where DeviceID = @DeviceID
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_DeviceInfo_Delete]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_DeviceInfo_Delete] 
(
  @DeviceID varchar(100)
)
As
Begin
  Delete Sys_DeviceInfo Where DeviceID = @DeviceID
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_CarPlace_Save]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Sys_CarPlace_Save]
(
  @ID int,
  @AreaCode varchar(100),
  @Province varchar(100),
  @City varchar(100),
  @CarNoPre varchar(10),
  @ProvinceShort varchar(10),
  @Lon VarChar(20),
  @Lat VarChar(20)
)
As
Begin
  if (@id is null)
  Begin
    insert into Sys_CarPlace (AreaCode,Province,City,CarNoPre,ProvinceShort,Lon,Lat)
      values (@AreaCode,@Province,@City,@CarNoPre,@ProvinceShort,@Lon,@Lat)
  End
  Else
  Begin
    update Sys_CarPlace 
        set 
         AreaCode = @AreaCode,
         Province = @Province,
         City = @City,
         CarNoPre = @CarNoPre,
         ProvinceShort = @ProvinceShort,
         Lon = @Lon,
         Lat = @Lat
        where id = @id
  End
  Select 'T'
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_CarPlace_GetByid]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_CarPlace_GetByid]
(
  @id int
)
As
begin
  Select * From Sys_CarPlace Where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_CarPlace_GetAll]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Sys_CarPlace_GetAll]
As
begin
  Select * From Sys_CarPlace
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Sys_CarPlace_Delete]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Sys_CarPlace_Delete] 
(
  @id int
)
As
Begin
  Delete Sys_CarPlace Where id = @id
End
GO
/****** Object:  View [dbo].[v_Car_TypeInfo]    Script Date: 04/09/2016 14:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[v_Car_TypeInfo]
As
  Select CTDate,UnitID,CarType,CarCount From Car_TypeInfo
  Union ALL
  Select CONVERT(VarChar(10),GetDate(),120),UnitID,B.CarType,CarCount = COUNT(*)
  From Car_CurrInfo A,Car_Info B
  Where A.CarNo = B.CarNo
  Group By UnitID,CarType
GO
/****** Object:  View [dbo].[v_Car_StayInfo_ALL]    Script Date: 04/09/2016 14:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[v_Car_StayInfo_ALL]
As
Select UnitID,CarNo,CarNoPre,EnterTime,LeaveTime,StayTime
From Car_StayInfo
Union ALL
Select UnitID,CarNo,CarNoPre,EnterTime,LeaveTime='2200-01-01',DATEDIFF(N,EnterTime,GETDATE()) As StayTime
From Car_CurrInfo
GO
/****** Object:  View [dbo].[v_Car_ComeFrom]    Script Date: 04/09/2016 14:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[v_Car_ComeFrom]
As
  Select CFDate,UnitID,CarNoPre,CarCount From Car_ComeFrom
  Union ALL
  Select CONVERT(VarChar(10),GetDate(),120),UnitID,CarNoPre,CarCount = COUNT(*)
  From Car_CurrInfo
  Group By UnitID,CarNoPre
GO
/****** Object:  StoredProcedure [dbo].[usp_WelcomeScenic_PC]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_WelcomeScenic_PC]
(
  @UnitID int
) 
as
begin
  --表0：单位名称，可容纳车辆最大数量，经度，纬度
  Select UnitName,CarMaxCount,Lat,Lnt
  From Sys_UnitInfo 
  Where UnitID = @UnitID
  --表1：设备个数
  Select DeviceCount = COUNT(*)
  From Sys_DeviceInfo 
  Where UnitID = @UnitID
  --表2：当前数量
  Select CurrCount = COUNT(*)
  From Car_CurrInfo
  Where UnitID = @UnitID
  
  Declare @CurrDate DateTime
  Select @CurrDate = CONVERT(DateTime,CONVERT(VarChar(10),GetDate(),120))
  --表3：当天的进入总数，离开总数
  Select EnterCount = IsNull(Sum(EnterCount),0),LeaveCount = IsNull(SUM(LeaveCount),0)
  From Car_ChangeInfo 
  Where UnitID = @UnitID 
	and rTime > @CurrDate 
  --表4：当前车辆变化，进入车辆变化，离开车辆变化
  Select A.rtime,
  CurrCount = IsNull(CurrCount,0),
  EnterCount = ISNULL(EnterCount,0),
  LeaveCount = ISNULL(LeaveCount,0)
  From Car_FiveMinute A
	Left outer join Car_ChangeInfo B 
	on Convert(Datetime,(@CurrDate + ' ' + a.rtime)) = b.rTime 
	and B.rTime >= @CurrDate
	And B.UnitID = @UnitID
  Order By A.rTime
  --表5：今日车辆类型
  Select CarType,COUNT(*) As TypeCount
  From v_Car_TypeInfo
  Where UnitID = @UnitID And CTDate >= @CurrDate
  Group By CarType
  --表6：来源地
  Select B.City,B.Lon,B.Lat,COUNT(*) As MCount
  From v_Car_ComeFrom A,Sys_CarPlace B 
  Where A.CarNoPre = B.CarNoPre And A.UnitID = @UnitID
	And A.CFDate >= @CurrDate
	And b.AreaCode <>'000000'
  Group By B.City,B.Lon,B.Lat
  Order by MCount
  --表7：今天的平均逗留时间
  Select StayTime = CONVERT(Decimal(10,2),AVG(StayTime * 1.0 / 60))
  From v_Car_StayInfo_All
  Where UnitID = @UnitID And LeaveTime > @CurrDate
end
GO
/****** Object:  StoredProcedure [dbo].[usp_WelcomeCounty_PC]    Script Date: 04/09/2016 14:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_WelcomeCounty_PC]
(
  @UnitID int
)
as
begin
  --把县级所有的旅游单位都放到临时表中
  
  Select A.UnitID,A.UnitType,B.UnitName,B.Lat,B.Lnt,B.CarMaxCount
  Into #TempUnit
  From  dbo.fun_UnitInfo_GetByUnitID(@UnitID) A,Sys_UnitInfo B
  Where A.UnitID = B.UnitID
 
  
  Declare @CarNoPre VarChar(10),@CurrDate DateTime
  Select @CarNoPre = CarNoPre From Sys_UnitInfo Where UnitID = @UnitID
   
  Select @CurrDate = CONVERT(DateTime,CONVERT(VarChar(10),GetDate(),120))
  --表0：当前单位的基本信息
  Select UnitID,UnitName,Lat,Lnt
  From Sys_UnitInfo 
  Where UnitID = @UnitID
 
  
  --表1：监控点数量
  Select DeviceCount = COUNT(*)
  From Sys_DeviceInfo A,#TempUnit B
  Where A.UnitID = B.UnitID
  
  --表2：概要信息,单位名称，当前车辆(图3)
  Select A.UnitID,A.UnitName,A.CarMaxCount,CurrCount = IsNull(COUNT(B.CarNo),0),
  StayTime = IsNull(CONVERT(decimal(10,1), AVG(D.StayTime * 1.0 / 60)),0),
  EnterCount = IsNull(Sum(C.EnterCount),0),
  LeaveCount = IsNull(SUM(C.LeaveCount),0)
  From #TempUnit A
  Left Outer Join Car_CurrInfo B on A.UnitID = B.UnitID
  Left Outer Join Car_ChangeInfo C on A.UnitID = C.UnitID and C.rTime > @CurrDate 
  Left Outer Join v_Car_StayInfo_ALl D on A.UnitID = D.UnitID And D.LeaveTime > @CurrDate
  Where A.UnitType = 0
  Group By A.UnitID,A.UnitName,A.CarMaxCount
  
  --表3：外地车辆
  Select OtherPlaceCount = IsNull(COUNT(*),0)
  From #TempUnit A,Car_CurrInfo B
  Where A.UnitID = B.UnitID And A.UnitType = 0
	And CarNoPre <> @CarNoPre
	
  --表4：高速口的进出车辆总数
  Select EnterCount = IsNull(Sum(EnterCount),0),
  LeaveCount = IsNull(SUM(LeaveCount),0)
  From Car_ChangeInfo
  Where UnitID = @UnitID And rTime > @CurrDate 
  
  
  
  --表5:图1,景区车辆的变化情况，图2，高速进出车辆变化情况！
  Select A.rtime,
  CurrCount = ISNULL(C.CurrCount,0),
  EnterCount = ISNULL(EnterCount,0),
  LeaveCount = ISNULL(LeaveCount,0)
  From Car_FiveMinute A
	Left outer join Car_ChangeInfo B 
	on Convert(Datetime,(@CurrDate + ' ' + a.rtime)) = b.rTime 
	and B.rTime >= @CurrDate
	And B.UnitID = @UnitID
	Left Outer Join (Select rTime,CurrCount = SUM(CurrCount) 
	From #TempUnit A,Car_ChangeInfo B
	Where A.UnitID = B.UnitID And B.rTime >= @CurrDate And A.UnitType = 0 
	Group By rTime) C
	on Convert(Datetime,(@CurrDate + ' ' + a.rtime)) = b.rTime 
  Order By A.rTime
  
  --表6：图4 来源地,只有高速的数据
  Select B.City,B.Lon,B.Lat,COUNT(*) As MCount
  From Car_ComeFrom A 
  Inner Join Sys_CarPlace B on A.CarNoPre = B.CarNoPre 
	And b.AreaCode <>'000000'
  Where UnitID = @UnitID And CFDate >= @CurrDate
  Group By B.City,B.Lon,B.Lat
  Order by MCount
  
   --表7：高速口的数据：平均逗留时间
  Select StayTime = IsNull(CONVERT(Decimal(10,2), AVG(StayTime) * 1.0 / 60),0)
  From Car_StayInfo
  Where UnitID = @UnitID And LeaveTime > @CurrDate
end
GO
/****** Object:  StoredProcedure [dbo].[usp_stat_Flow_ByMonth]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_stat_Flow_ByMonth]
(
  @BeginDate DateTime,
  @EndDate DateTime,
  @UnitID int
)
as
begin
  Declare @Date int
  Select @Date = Datepart(D,DATEADD(D,-1,@EndDate))
  
  Select A.SDate,IsNull(COUNT(B.CarNo),0) As FCount
  From Stat_Date A
    Left Outer Join v_Car_StayInfo_ALL B on A.SDate = DATEPART(D,B.LeaveTime)
	And B.LeaveTime Between @BeginDate And @EndDate And B.UnitID = @UnitID
  Where A.SDate <= @Date
  Group By A.SDate
  Order by A.SDate
end
GO
/****** Object:  StoredProcedure [dbo].[usp_stat_CountyFlow_ByMonth]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_stat_CountyFlow_ByMonth]
(
  @BeginDate DateTime,
  @EndDate DateTime,
  @UnitID int
)
as
begin
  Declare @Date int
  Select @Date = Datepart(D,DATEADD(D,-1,@EndDate))
  
  Select A.SDate,EnterCount = IsNull(Sum(B.EnterCount),0),
    LeaveCount = ISNULL(SUM(B.LeaveCount),0),
    DateCount = IsNull(COUNT(C.CarNo),0)
  From Stat_Date A
    Left Outer Join Car_ChangeInfo B on A.SDate = DATEPART(D,B.rTime)
	And B.rTime Between @BeginDate And @EndDate And B.UnitID = @UnitID
	Left Outer Join (Select DATEPART(D,A.LeaveTime) As sDate,A.CarNo
	From v_Car_StayInfo_ALL A,dbo.fun_UnitInfo_GetByUnitID(@UnitID) B
	Where A.UnitID = B.UnitID And B.UnitType = 0 
	And A.LeaveTime Between @BeginDate And @EndDate) C on
	A.SDate = C.SDate
  Where A.SDate <= @Date
  Group By A.SDate
  Order by A.SDate
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_County_ComeFrom]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Stat_County_ComeFrom]
(
  @BeginDate DateTime,
  @EndDate DateTime,
  @AreaType int,
  @UnitID int
)
As
Begin

  if (@AreaType = 0)
  Begin
    --高速数据,车辆来源地
    Select B.Province As ChartX,SUM(A.CarCount) As ChartY
	From v_Car_ComeFrom a,Sys_CarPlace B
	Where A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate And A.UnitID = @UnitID
		And B.AreaCode <> '000000'
	Group By B.Province
	Order by ChartY Desc
	
	--高速数据，车辆停留时间
	Select top 20 Convert(Decimal(10,1),(StayTime * 1.0 / 60)) as ChartX,COUNT(*) As ChartY
	From v_Car_StayInfo_ALL
	Where LeaveTime Between @BeginDate And @EndDate And UnitID = @UnitID
	Group by Convert(Decimal(10,1),(StayTime * 1.0 / 60))
	Order by ChartY desc
	
	--景区数据，车辆来源地
	Select B.Province As ChartX,SUM(A.CarCount) As ChartY
	From v_Car_ComeFrom A,Sys_CarPlace B,dbo.fun_UnitInfo_GetByUnitID(@UnitID) C
	Where A.UnitID = C.UnitID And C.UnitType=  0 
		And  A.CarNoPre = B.CarNoPre And A.CFDate Between @BeginDate And @EndDate
		And B.AreaCode <> '000000'
	Group By B.Province
	Order by ChartY Desc
	
	--景区数据，车辆逗留时间
	Select top 20 Convert(Decimal(10,1),(StayTime * 1.0 / 60)) as ChartX,COUNT(*) As ChartY
	From v_Car_StayInfo_ALL A,dbo.fun_UnitInfo_GetByUnitID(@UnitID) B
	Where A.UnitID = B.UnitID And B.UnitType = 0 
		And  A.LeaveTime Between @BeginDate And @EndDate
	Group by Convert(Decimal(10,1),(StayTime * 1.0 / 60))
	Order by ChartY desc
  End
  if (@AreaType = 1)
  Begin
	  Select B.City As ChartX,SUM(A.CarCount) As ChartY
	  From v_Car_ComeFrom a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate And A.UnitID = @UnitID
		And B.AreaCode <> '000000'
	  Group By B.City
	  Order by ChartY Desc
	  
	  Select top 20 Convert(Decimal(10,1),(StayTime * 1.0 / 60)) as ChartX,COUNT(*) As ChartY
	From v_Car_StayInfo_ALL
	Where LeaveTime Between @BeginDate And @EndDate And UnitID = @UnitID
	Group by Convert(Decimal(10,1),(StayTime * 1.0 / 60))
	Order by ChartY desc
	  
	  Select B.City As ChartX,SUM(A.CarCount) As ChartY
	  From v_Car_ComeFrom a,Sys_CarPlace B,dbo.fun_UnitInfo_GetByUnitID(@UnitID) C
	  Where A.UnitID = C.UnitID And C.UnitType = 0 
		And A.CarNoPre = b.CarNoPre 
		And A.CFDate Between @BeginDate And @EndDate
		And B.AreaCode <> '000000'
	  Group By B.City
	  Order by ChartY Desc
	  
	  Select top 20 Convert(Decimal(10,1),(StayTime * 1.0 / 60)) as ChartX,COUNT(*) As ChartY
	From v_Car_StayInfo_ALL A,dbo.fun_UnitInfo_GetByUnitID(@UnitID) B
	Where A.UnitID = B.UnitID And B.UnitType = 0 
		And  A.LeaveTime Between @BeginDate And @EndDate
	Group by Convert(Decimal(10,1),(StayTime * 1.0 / 60))
	Order by ChartY desc
	
  End
  if (@AreaType = 2)
  Begin
	  Select B.City As ChartX,SUM(A.CarCount) As ChartY
	From v_Car_ComeFrom a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate
		And B.AreaCode like '33%' And A.UnitID = @UnitID
	  Group By B.City
	  Order by ChartY Desc
	  
	  Select top 20 Convert(Decimal(10,1),(StayTime * 1.0 / 60)) as ChartX,COUNT(*) As ChartY
	From v_Car_StayInfo_ALL A,Sys_CarPlace B
	Where A.CarNoPre = B.CarNoPre And A.LeaveTime  Between @BeginDate And @EndDate 
	And A.UnitID = @UnitID And B.AreaCode like '33%'
	Group by Convert(Decimal(10,1),(StayTime * 1.0 / 60))
	Order by ChartY desc
	
	Select B.City As ChartX,SUM(A.CarCount) As ChartY
	From v_Car_ComeFrom a,Sys_CarPlace B,dbo.fun_UnitInfo_GetByUnitID(@UnitID) C
	  Where A.UnitID = C.UnitID And C.UnitType = 0 
		And A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate
		And B.AreaCode like '33%'
	  Group By B.City
	  Order by ChartY Desc
	  
	   Select top 20 Convert(Decimal(10,1),(StayTime * 1.0 / 60)) as ChartX,COUNT(*) As ChartY
	From v_Car_StayInfo_ALL A,Sys_CarPlace B,dbo.fun_UnitInfo_GetByUnitID(@UnitID) C
	Where A.UnitID = C.UnitID And C.UnitType = 0 
		And A.CarNoPre = B.CarNoPre
		And A.LeaveTime Between @BeginDate And @EndDate
		And B.AreaCode like '33%'
	Group by Convert(Decimal(10,1),(StayTime * 1.0 / 60))
	Order by ChartY desc
	  
  End
  if (@AreaType = 3)
  Begin
	  Select B.City As ChartX,SUM(A.CarCount) As ChartY
	  From v_Car_ComeFrom a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate
		And B.AreaCode not like '33%' And A.UnitID = @UnitID
		And B.AreaCode <> '000000'
	  Group By B.City
	  Order by ChartY Desc
	  
	  Select top 20 Convert(Decimal(10,1),(StayTime * 1.0 / 60)) as ChartX,COUNT(*) As ChartY
	From v_Car_StayInfo_ALL A,Sys_CarPlace B
	Where A.CarNoPre = B.CarNoPre 
	And A.LeaveTime  Between @BeginDate And @EndDate 
	And A.UnitID = @UnitID 
	And B.AreaCode not like '33%'
	Group by Convert(Decimal(10,1),(StayTime * 1.0 / 60))
	Order by ChartY desc
	
	Select B.City As ChartX,SUM(A.CarCount) As ChartY
	From v_Car_ComeFrom a,Sys_CarPlace B,dbo.fun_UnitInfo_GetByUnitID(@UnitID) C
	  Where A.UnitID = C.UnitID And C.UnitType = 0 
		And A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate
		And B.AreaCode not like '33%'
		And B.AreaCode <> '000000'
	  Group By B.City
	  Order by ChartY Desc
	  
	   Select top 20 Convert(Decimal(10,1),(StayTime * 1.0 / 60)) as ChartX,COUNT(*) As ChartY
	From v_Car_StayInfo_ALL A,Sys_CarPlace B,dbo.fun_UnitInfo_GetByUnitID(@UnitID) C
	Where A.UnitID = C.UnitID And C.UnitType = 0 
		And A.CarNoPre = B.CarNoPre
		And A.LeaveTime Between @BeginDate And @EndDate
		And B.AreaCode not like '33%'
	Group by Convert(Decimal(10,1),(StayTime * 1.0 / 60))
	Order by ChartY desc
  End
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_County_CarTypeCount]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Stat_County_CarTypeCount]
(
  @BeginDate DateTime,
  @EndDate DateTime,
  @UnitID int
)
As
Begin
  Select CarType,SUM(CarCount) As TypeCount
  From v_Car_TypeInfo
  Where CTDate Between @BeginDate And @EndDate
	 And UnitID = @UnitID
  Group By CarType
  Order by TypeCount Desc
  
  Select CarType,SUM(CarCount) As TypeCount
  From v_Car_TypeInfo A,dbo.fun_UnitInfo_GetByUnitID(@UnitID) B
  Where A.UnitID = B.UnitID And B.UnitType = 0
	And A.CTDate Between @BeginDate And @EndDate
  Group By CarType
  Order by TypeCount Desc
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_Car_TypeCount]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Stat_Car_TypeCount]
(
  @BeginDate DateTime,
  @EndDate DateTime,
  @UnitID int
)
As
Begin
  Select CarType,SUM(CarCount) As TypeCount
  From v_Car_TypeInfo
  Where CTDate Between @BeginDate And @EndDate
	 And UnitID = @UnitID
  Group By CarType
  Order by TypeCount Desc
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_Car_TopCount_ByCarNo]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Stat_Car_TopCount_ByCarNo]
(
  @BeginDate DateTime,
  @EndDate DateTime,
  @CarNo VarChar(10),
  @UnitID int
)
As
Begin
  Select A.CarNo,B.CarColor,B.CarType,C.Province,C.City,
  COUNT(*) As EnterCount,
  Convert(Decimal(10,2),SUM(StayTime) * 1.0 / 60) as StayHour
  from Car_StayInfo A,Car_Info B,Sys_CarPlace C,dbo.fun_UnitInfo_GetByUnitID(@UnitID) D
  where A.CarNO = B.CarNo And A.EnterTime Between @BeginDate And @EndDate
	And B.AreaCode = C.AreaCode And B.CarNoPre = C.CarNoPre
	And A.CarNo like '%'+@CarNo+'%' And A.UnitID = D.UnitID
  Group By A.CarNo,B.CarColor,B.CarType,C.Province,C.City
  Order by EnterCount Desc
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_Car_TopCount]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Stat_Car_TopCount]
(
  @UnitID int,
  @BeginDate DateTime,
  @EndDate DateTime
)
As
Begin
  
  Select A.CarNo,B.CarColor,B.CarType,C.Province,C.City,
  COUNT(*) As EnterCount,
  Convert(Decimal(10,2),SUM(StayTime) * 1.0 / 60) as StayHour
  from Car_StayInfo A,Car_Info B,Sys_CarPlace C,dbo.fun_UnitInfo_GetByUnitID(@UnitID) D
  where A.CarNO = B.CarNo And A.EnterTime Between @BeginDate And @EndDate
	And B.AreaCode = C.AreaCode And B.CarNoPre = C.CarNoPre
	And A.UnitID = D.UnitID
  Group By A.CarNo,B.CarColor,B.CarType,C.Province,C.City
  Order by EnterCount Desc
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_Car_StayHour]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Stat_Car_StayHour]
(
  @BeginDate DateTime,
  @EndDate DateTime,
  @AreaType int
)
As
Begin
  if @AreaType = 0
  Begin
	Select B.Province As DestName,Convert(Decimal(10,2),SUM(StayTime) * 1.0 / 60) As StayHour
	  From v_Car_StayInfo_ALL a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.EnterTime Between @BeginDate And @EndDate
	  Group By B.Province
	  Order by StayHour Desc
  End
  
  if @AreaType = 1
  Begin
	  Select B.City As DestName,Convert(Decimal(10,2),SUM(StayTime) * 1.0 / 60) As StayHour
	  From v_Car_StayInfo_ALL a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.EnterTime Between @BeginDate And @EndDate
	  
	  Group By B.City
	  Order by StayHour Desc
  End
  if @AreaType = 2
  Begin
	  Select B.City As DestName,Convert(Decimal(10,2),SUM(StayTime) * 1.0 / 60) As StayHour
	  From v_Car_StayInfo_ALL a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.EnterTime Between @BeginDate And @EndDate
	  And B.AreaCode like '33%'
	  Group By B.City
	  Order by StayHour Desc
  End
  if @AreaType = 3
  Begin
	  Select B.City As DestName,Convert(Decimal(10,2),SUM(StayTime) * 1.0 / 60) As StayHour
	  From v_Car_StayInfo_ALL a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.EnterTime Between @BeginDate And @EndDate
	  And B.AreaCode not like '33%'
	  Group By B.City
	  Order by StayHour Desc
  End
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_CurrInfo_Leave]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_CurrInfo_Leave]
(
  @CarNo VarChar(10),
  @UnitID int,
  @DeviceID Int,
  @PassTime DateTime,
  @StayMin int,
  @CarType int
)
As
Begin
  if Exists (Select * From Car_CurrInfo Where CarNo = @CarNo And UnitID = @UnitID)
  Begin
	 Declare @StayTime int,@EnterTime Datetime   
	 Select @EnterTime = EnterTime From Car_CurrInfo Where CarNo = @CarNo And UnitID = @UnitID
	 Select @StayTime = DATEDIFF(N,@EnterTime,@PassTime)
	 --过路车辆判断
	 if (@StayTime > @StayMin)
     Begin
		  --不是过路车，则记录当前的停留时间
		  --记录景区关联度
		  Exec usp_Unit_Relate_Save @CarNo,@UnitID
		  Declare @PassDate DateTime,@CarNoPre VarChar(10)
		  Select @PassDate = Convert(VarChar(10),@PassTime,120),@CarNoPre = LEFT(@CarNo,2)
		  --记录车辆来源地，记录车型
		  Exec usp_Car_ComeFrom_Save @CarNoPre,@UnitID,@PassDate
	      Exec usp_Car_TypeInfo_Save @CarType,@UnitID,@PassDate
	      
		  Insert into Car_StayInfo (UnitID,CarNo,CarNoPre,EnterTime,LeaveTime,StayTime)
			Values (@UnitID,@CarNo,LEFT(@CarNo,2),@EnterTime,@PassTime,@StayTime)
			
		  exec usp_Car_ChangeInfo_Leave @UnitID,@PassTime,1
	 End
     Else
     Begin
      --过路车，进入的数量 - 1
        if Exists (Select * From Car_CurrCount where DeviceID = @DeviceID And UnitID = @UnitID)
        Begin
          Exec usp_Car_ChangeInfo_Leave @UnitID,@PassTime,0
	    End
     End
  End
  Else
  Begin
    --不存在的记录
	Exec usp_Car_ChangeInfo_Leave @UnitID,@PassTime,1
  End
	  
  Delete Car_CurrInfo Where CarNo = @CarNo
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_CurrInfo_Enter]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_CurrInfo_Enter]
(
  @CarNo Varchar(10),
  @UnitID int,
  @DeviceID int,
  @PassTime DateTime
)
As
Begin
  if Exists (Select * from Car_CurrInfo Where CarNo = @CarNo)
	  Begin
	    --已经存在，则更新时间，抛弃掉前一个时间？
	    UpDate Car_CurrInfo Set EnterTime = @PassTime,UnitID = @UnitID Where CarNo = @CarNo
	  End
	  Else
	  Begin
	    Insert Into Car_CurrInfo (UnitID,CarNo,CarNoPre,EnterTime)
			Values (@UnitID,@CarNo,Left(@CarNo,2),@PassTime)
	  End
	  Exec usp_Car_ChangeInfo_Current @UnitID,@PassTime
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Stat_Car_ComeFrom]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Stat_Car_ComeFrom]
(
  @BeginDate DateTime,
  @EndDate DateTime,
  @AreaType int,
  @UnitID int
)
As
Begin
  if (@AreaType = 0)
  Begin
    Select B.Province As DestName,SUM(A.CarCount) As ComeCount
	From v_Car_ComeFrom a,Sys_CarPlace B
	Where A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate And A.UnitID = @UnitID
		And B.AreaCode <> '000000'
	Group By B.Province
	Order by ComeCount Desc
	
	Select top 20 StayTime,COUNT(*) As CarCount
	From v_Car_StayInfo_ALL
	Where LeaveTime Between @BeginDate And @EndDate And UnitID = @UnitID
	Group by StayTime
	Order by CarCount
	
  End
  if (@AreaType = 1)
  Begin
	  Select B.City As DestName,SUM(A.CarCount) As ComeCount
	  From v_Car_ComeFrom a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate And A.UnitID = @UnitID
		And B.AreaCode <> '000000'
	  Group By B.City
	  Order by ComeCount Desc
	  
	  Select top 20 StayTime,COUNT(*) As CarCount
	From v_Car_StayInfo_ALL
	Where LeaveTime Between @BeginDate And @EndDate And UnitID = @UnitID
	Group by StayTime
	Order by CarCount
	
  End
  if (@AreaType = 2)
  Begin
	  Select B.City As DestName,SUM(A.CarCount) As ComeCount
	From v_Car_ComeFrom a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate
		And B.AreaCode like '33%' And A.UnitID = @UnitID
	  Group By B.City
	  Order by ComeCount Desc
	  
	  Select top 20 StayTime,COUNT(*) As CarCount
	From v_Car_StayInfo_ALL a,Sys_CarPlace B
	Where A.CarNoPre = b.CarNoPre And A.LeaveTime Between @BeginDate And @EndDate
		And B.AreaCode like '33%' And A.UnitID = @UnitID
	Group by StayTime
	Order by CarCount
  End
  if (@AreaType = 3)
  Begin
	  Select B.City As DestName,SUM(A.CarCount) As ComeCount
	From v_Car_ComeFrom a,Sys_CarPlace B
	  Where A.CarNoPre = b.CarNoPre And A.CFDate Between @BeginDate And @EndDate
		And B.AreaCode not like '33%' And A.UnitID = @UnitID
		And B.AreaCode <> '000000'
	  Group By B.City
	  Order by ComeCount Desc
	  
	  Select top 20 StayTime,COUNT(*) As CarCount
	From v_Car_StayInfo_ALL a,Sys_CarPlace B
	Where A.CarNoPre = b.CarNoPre And A.LeaveTime Between @BeginDate And @EndDate
		And B.AreaCode not like '33%' And A.UnitID = @UnitID
	Group by StayTime
	Order by CarCount
	
  End
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_PassInfo_SaveForHighSpeed]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Car_PassInfo_SaveForHighSpeed]
(  
 @CarNo varchar(10),
 @PassTime datetime,  
 @DataTime datetime,  
 @CarColor int,  
 @CarType int,  
 @CarDirection int,
 @CarImg varchar(100),
 @UnitID int,
 @DeviceID int
)  
as  
Begin
  Insert into Car_PassInfo (UnitID,DeviceID,CarNo,PassTime,DataTime,CarColor,CarType,CarDirection,CarImg)  
	values (@UnitID,@DeviceID,@CarNo,@PassTime,@DataTime,@CarColor,@CarType,@CarDirection,@CarImg)
	--方向判断
	Declare @CarNoPre VarChar(10)
	Select @CarNoPre = LEFT(@CarNo,2)
	
	if (@CarDirection = 0)
	Begin
	  Exec usp_Car_ChangeInfo_Enter @UnitID,@PassTime
	  Declare @PassDate DateTime
	  Select @PassDate = Convert(VarChar(10),@PassTime,120)
	  
	  Exec usp_Car_ComeFrom_Save @CarNoPre,@UnitID,@PassDate
	  Exec usp_Car_TypeInfo_Save @CarType,@UnitID,@PassDate
	  
	end
	Else
	Begin
	  Exec usp_Car_ChangeInfo_Leave @UnitID,@PassTime,1
	  --写入到停留时间中！
	  Declare @EnterTime DateTime
	  Select Top 1 @EnterTime = PassTime
	  From Car_PassInfo 
	  Where UnitID = @UnitID And CarDirection = 0
	  Order by PassTime Desc
	  if (@EnterTime Is Not Null)
	  Begin
	    Declare @StayTime int
	    Select @StayTime = DATEDIFF(N,@EnterTime,@PassTime)
	    if (@StayTime < 60*24*3)
	    Begin
			--3天内监测到，认为是旅游车辆！
			--记录到景区关联
			Exec usp_Unit_Relate_Save @CarNo,@UnitID
			--记录到停留时间
			Insert Into Car_StayInfo (UnitID,CarNo,CarNoPre,EnterTime,LeaveTime,StayTime)
			Values (@UnitID,@CarNo,@CarNoPre,@EnterTime,@PassTime,@StayTime)
		End
	  End
	End
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_PassInfo_Save]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_PassInfo_Save]
(
  @CarNo varchar(10),
  @PassTime datetime,  
  @DataTime datetime,  
  @CarColor int,  
  @CarType int,  
  @CarDirection int,
  @CarImg varchar(100),
  @UnitID int,
  @DeviceID int,
  @StayMin int
)
As
Begin
   --非员工车辆
   Insert into Car_PassInfo (UnitID,DeviceID,CarNo,PassTime,DataTime,CarColor,CarType,CarDirection,CarImg)  
   values (@UnitID,@DeviceID,@CarNo,@PassTime,@DataTime,@CarColor,@CarType,@CarDirection,@CarImg)
   if (@CarDirection = 0)
	begin
	  Exec usp_Car_CurrInfo_Enter @CarNo,@UnitID,@DeviceID,@PassTime
	end
	else
	begin
	  Exec usp_Car_CurrInfo_Leave @CarNo,@UnitID,@DeviceID,@PassTime,@StayMin,@CarType
	end
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_PassInfo_Save_Normal]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_PassInfo_Save_Normal]
(
  @CarNo varchar(10),
  @PassTime datetime,  
  @DataTime datetime,  
  @CarColor int,  
  @CarType int,  
  @CarDirection int,
  @CarImg varchar(100),
  @UnitID int,
  @DeviceID int,
  @StayMin int
)
As
Begin
  if Exists (Select * From Car_EmployeeNo where CarNo = @CarNo And UnitID = @UnitID)
  Begin
    --正常的员工车辆处理(暂时不考虑更多！！！)
    Exec usp_Car_EmployeePassInfo_Save @CarNo,@PassTime,@DataTime,@CarColor,@CarType,@CarDirection,@CarImg,@UnitID,@DeviceID
  End
  else
  Begin
    --正常的非员工车辆处理
    Exec usp_Car_PassInfo_Save @CarNo,@PassTime,@DataTime,@CarColor,@CarType,@CarDirection,@CarImg,@UnitID,@DeviceID,@StayMin
  End
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_PassInfo_TwoWay_Save]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_PassInfo_TwoWay_Save]
(
  @CarNo varchar(10),
  @PassTime datetime,  
  @DataTime datetime,  
  @CarColor int,  
  @CarType int,  
  @CarDirection int,
  @CarImg varchar(100),
  @UnitID int,
  @DeviceID int,
  @StayMin int,
  @LeaveUnitID int,
  @LeaveStayMin int
)
As
Begin
  if (@CarDirection = 0)
   begin
      --先处理离开，再处理进入
	  Exec usp_Car_PassInfo_Save_Normal @CarNo,@PassTime,@DataTime,@CarColor,@CarType,1,@LeaveUnitID,@DeviceID,@LeaveStayMin
	  Exec usp_Car_PassInfo_Save_Normal @CarNo,@PassTime,@DataTime,@CarColor,@CarType,0,@UnitID,@DeviceID,@StayMin
	end
	else
	begin
	  Exec usp_Car_PassInfo_Save_Normal @CarNo,@PassTime,@DataTime,@CarColor,@CarType,1,@UnitID,@DeviceID,@StayMin
	  Exec usp_Car_PassInfo_Save_Normal @CarNo,@PassTime,@DataTime,@CarColor,@CarType,0,@LeaveUnitID,@DeviceID,@LeaveStayMin
	end
End
GO
/****** Object:  StoredProcedure [dbo].[usp_Car_SaveTemp_Proc]    Script Date: 04/09/2016 14:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[usp_Car_SaveTemp_Proc]
As
Begin
  Select * Into #Temp From Car_SaveTemp
  Delete Car_SaveTemp Where id in (Select ID From #Temp)
  DeClare @ProcCount int,@ErrorCount int
  Select @ProcCount = COUNT(*) From #Temp
  
  if (@ProcCount > 0)
  Begin
	  Declare @DeviceID int,@DeviceArc Int,@UnitID int,@LeaveUnitID int
	  Select @ErrorCount = 0
	  Declare @CarNoPre VarChar(10),@StayMin int
	  
	  Declare @DeviceName varchar(100),@CarNo varchar(10),@PassTime datetime,@CarColor int,@CarType int,@CarDirection int,
		@CarImg varchar(100),@DataTime datetime
	  
	  Declare Cur_Car cursor
	  for Select DeviceName,CarNo,PassTime,CarColor,CarType,CarDirection,CarImg,DataTime
	  From #Temp 
	  Open Cur_Car
	  Fetch Next From Cur_Car Into @DeviceName,@CarNo ,@PassTime,@CarColor,@CarType,@CarDirection,@CarImg,@DataTime
	  
	  While @@FETCH_STATUS = 0
	  Begin
		Select @DeviceID = DeviceID,@DeviceArc = DeviceArc,@UnitID = UnitID,@LeaveUnitID = LeaveUnitID
		From Sys_DeviceInfo Where DeviceName = @DeviceName
		if (@DeviceID Is not Null)
	    Begin
	      Select @CarNoPre = LEFT(@CarNo,2)
	      Exec usp_Car_Info_Save @CarNo,@CarNoPre,@CarColor,@CarType
	      Select @StayMin = PassTime From Sys_UnitInfo Where UnitID = @UnitID
	      
	      if (@DeviceArc = 0)
	      Begin
	        --景区常规
	        Exec usp_Car_PassInfo_Save_Normal @CarNo,@PassTime,@DataTime,@CarColor,@CarType,@CarDirection,@CarImg,@UnitID,@DeviceID,@StayMin
	      End
	      Else if (@DeviceArc = 1)
	      Begin
	        --高速
	        Exec usp_Car_PassInfo_SaveForHighSpeed @CarNo,@PassTime,@DataTime,@CarColor,@CarType,@CarDirection,@CarImg,@UnitID,@DeviceID
	      End
	      Else if (@DeviceArc = 2)
	      Begin
	        --双向
	        Exec usp_Car_PassInfo_TwoWay_Save @CarNo,@PassTime,@DataTime,@CarColor,@CarType,@CarDirection,@CarImg,@UnitID,@DeviceID,@StayMin,@LeaveUnitID
	      End
	      Else
	      Begin
	        Exec usp_Car_ErrorInfo_Save @DeviceName,@CarNo ,@PassTime,@CarColor,@CarType,@CarDirection,@CarImg,@DataTime,'没有相关的算法实现',@ErrorCount output
	      End
	    End
	    Else
	    Begin
	      Exec usp_Car_ErrorInfo_Save @DeviceName,@CarNo ,@PassTime,@CarColor,@CarType,@CarDirection,@CarImg,@DataTime,'没有找到相关设备',@ErrorCount output
	    End
		Fetch Next From Cur_Car Into @DeviceName,@CarNo ,@PassTime,@CarColor,@CarType,@CarDirection,@CarImg,@DataTime
	  End
	  Close Cur_Car
	  Deallocate Cur_Car
	  --修正景区当前的车辆信息
	  Exec usp_Car_ChangeInfo_CurrCount_UpDate
	  Insert Into Car_Log (ProcTime,ProcCount,ErrorCount)
		Values (GETDATE(),@ProcCount,@ErrorCount)
  End
End
GO
