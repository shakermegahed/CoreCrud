CREATE TABLE [dbo].[Place] (
    [PlaceId]        UNIQUEIDENTIFIER NOT NULL,
    [DestinationId]  UNIQUEIDENTIFIER NULL,
    [Name]           NVARCHAR (50)    NULL,
    [IsApproved]     BIT              NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              CONSTRAINT [DF_Place_IsDeleted] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED ([PlaceId] ASC),
    CONSTRAINT [FK_Place_Destination] FOREIGN KEY ([DestinationId]) REFERENCES [dbo].[Destination] ([DestinationId]) ON DELETE CASCADE
);





