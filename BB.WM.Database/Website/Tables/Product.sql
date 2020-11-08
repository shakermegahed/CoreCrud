CREATE TABLE [Website].[Product] (
    [ProductId]      UNIQUEIDENTIFIER NOT NULL,
    [ProductTitle]   NVARCHAR (100)   NULL,
    [Images]         NVARCHAR (MAX)   NULL,
    [Description]    NVARCHAR (MAX)   NULL,
    [CategoryId]     UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductId] ASC),
    CONSTRAINT [FK_Product_Category] FOREIGN KEY ([CategoryId]) REFERENCES [Website].[Category] ([CategoryId])
);







