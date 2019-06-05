-- =============================================
-- DROP PROCEDURE dbo.ReportBuilderForAllSelection_LiveDataNew_Columnstore
-- =============================================
IF OBJECT_ID('dbo.ReportBuilderForAllSelection_LiveDataNew_Columnstore', 'P') IS NOT NULL
  BEGIN
    PRINT RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,25)) + ' »»» ' + 'Start DROP PROCEDURE dbo.ReportBuilderForAllSelection_LiveDataNew_Columnstore;';
    ;--
    DROP PROCEDURE dbo.ReportBuilderForAllSelection_LiveDataNew_Columnstore;
    ;--
    PRINT RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,25)) + ' »»» ' + 'End   DROP PROCEDURE dbo.ReportBuilderForAllSelection_LiveDataNew_Columnstore;';
  END
ELSE
  PRINT RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,25)) + ' »»» ' + 'PROCEDURE dbo.ReportBuilderForAllSelection_LiveDataNew_Columnstore does not exist.';
;--
GO



-- =============================================
-- DROP TABLE SyncTables.Log_AlterTable
-- =============================================
DECLARE @SQL_Backup    nvarchar(MAX);
DECLARE @TimestampText nvarchar(MAX);
SET     @TimestampText = RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,112)) + '_' + REPLACE(RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,114)),':','');
PRINT RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,25)) + ' »»» ' + '@TimestampText = ' + RTRIM(CONVERT(nvarchar(max),@TimestampText));
;--
IF OBJECT_ID('SyncTables.Log_AlterTable', 'U') IS NOT NULL
  BEGIN
    PRINT RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,25)) + ' »»» ' + 'BackUp TABLE SyncTables.Log_AlterTable;';
    ;--
        SET @SQL_Backup  =
      N'SELECT *
            INTO Compas_Rogers_Care_Archive.SyncTables.Log_AlterTable_Backup_'
      + RTRIM(@TimestampText) + '
            FROM SyncTables.Log_AlterTable';
        PRINT 'Before execute: ' + @SQL_Backup;
          EXECUTE sp_executesql @SQL_Backup;
    ;--
    PRINT RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,25)) + ' »»» ' + 'Start  DROP TABLE SyncTables.Log_AlterTable;';
    ;--
    DROP TABLE SyncTables.Log_AlterTable;
    ;--
    PRINT RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,25)) + ' »»» ' + 'End    DROP TABLE SyncTables.Log_AlterTable;';
  END
ELSE
  PRINT RTRIM(CONVERT(CHAR,CURRENT_TIMESTAMP,25)) + ' »»» ' + 'TABLE SyncTables.Log_AlterTable does not exist.';
;--
GO
