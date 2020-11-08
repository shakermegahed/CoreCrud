CREATE TABLE [Account].[Account] (
    [AccountId]          UNIQUEIDENTIFIER NOT NULL,
    [Email]              NVARCHAR (255)   NOT NULL,
    [NormalizedEmail]    NVARCHAR (255)   NOT NULL,
    [UserName]           NVARCHAR (255)   NOT NULL,
    [NormalizedUserName] NVARCHAR (255)   NOT NULL,
    [FirstName]          NVARCHAR (100)   NOT NULL,
    [LastName]           NVARCHAR (100)   NOT NULL,
    [EmailConfirmed]     BIT              NOT NULL,
    [Status]             INT              NOT NULL,
    [CreatedOn]          DATETIME         NOT NULL,
    [CreatedBy]          UNIQUEIDENTIFIER NULL,
    [LastModifiedOn]     DATETIME         NULL,
    [LastModifiedBy]     UNIQUEIDENTIFIER NULL,
    [IsDeleted]          BIT              NULL,
    [PasswordHash]       NVARCHAR (MAX)   NULL,
    [SecurityStamp]      NVARCHAR (255)   NULL,
    [LockoutEndDateUtc]  DATETIME         NULL,
    [LockoutEnabled]     BIT              NULL,
    [AccessFailedCount]  NCHAR (10)       NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ([AccountId] ASC)
);



