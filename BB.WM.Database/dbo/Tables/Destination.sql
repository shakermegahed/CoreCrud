CREATE TABLE [dbo].[Destination] (
    [DestinationId]  UNIQUEIDENTIFIER NOT NULL,
    [CountryId]      UNIQUEIDENTIFIER NULL,
    [Name]           NVARCHAR (50)    NULL,
    [IsApproved]     BIT              NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              CONSTRAINT [DF_City_IsDeleted] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Destination] PRIMARY KEY CLUSTERED ([DestinationId] ASC),
    CONSTRAINT [FK_Destination_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([CountryId]) ON DELETE CASCADE
);









