CREATE TABLE [dbo].[Form] (
    [FormId]        UNIQUEIDENTIFIER NOT NULL,
    [WebSiteDomain] NVARCHAR (150)   NOT NULL,
    [FormType]      NVARCHAR (150)   NOT NULL,
    [FormContent]   NVARCHAR (MAX)   NULL,
    [CreationDate]  DATETIME         NULL,
    CONSTRAINT [PK_Form] PRIMARY KEY CLUSTERED ([FormId] ASC)
);





