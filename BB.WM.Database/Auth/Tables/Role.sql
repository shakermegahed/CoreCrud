CREATE TABLE [Auth].[Role] (
    [RoleId]             UNIQUEIDENTIFIER NOT NULL,
    [RoleName]           NVARCHAR (50)    NULL,
    [NormalizedRoleName] NVARCHAR (50)    NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([RoleId] ASC)
);

