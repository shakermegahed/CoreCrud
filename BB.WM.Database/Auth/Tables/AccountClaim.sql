CREATE TABLE [Auth].[AccountClaim] (
    [ClaimId]    INT              NOT NULL,
    [AccountId]  UNIQUEIDENTIFIER NULL,
    [ClaimType]  NVARCHAR (255)   NULL,
    [ClaimValue] NVARCHAR (255)   NULL,
    CONSTRAINT [PK_AccountClaim] PRIMARY KEY CLUSTERED ([ClaimId] ASC)
);

