CREATE TABLE [Auth].[AccountRole] (
    [AccountId] UNIQUEIDENTIFIER NOT NULL,
    [RoleId]    UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn] DATETIME         NOT NULL,
    [CreatedBy] UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_AccountRole] PRIMARY KEY CLUSTERED ([AccountId] ASC, [RoleId] ASC)
);

