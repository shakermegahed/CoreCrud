CREATE TABLE [Website].[FieldAttribute] (
    [FieldAttributeId] UNIQUEIDENTIFIER NOT NULL,
    [Name]             NVARCHAR (MAX)   NULL,
    [Type]             NCHAR (10)       NULL,
    [Required]         BIT              NULL,
    [MaxLength]        INT              NULL,
    [MinLength]        INT              NULL,
    [WebsiteId]        UNIQUEIDENTIFIER NULL,
    [CreatedOn]        DATETIME         NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NULL,
    [LastModifiedOn]   DATETIME         NULL,
    [LastModifiedBy]   UNIQUEIDENTIFIER NULL,
    [IsDeleted]        BIT              NULL,
    CONSTRAINT [PK_FieldAttribute] PRIMARY KEY CLUSTERED ([FieldAttributeId] ASC),
    CONSTRAINT [FK_Field_Website] FOREIGN KEY ([FieldAttributeId]) REFERENCES [Website].[WebSite] ([WebSiteId]) ON DELETE CASCADE
);

