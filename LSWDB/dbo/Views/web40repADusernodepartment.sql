
CREATE VIEW [dbo].[web40repADusernodepartment]
AS
SELECT      TOP 1000000 Username, Userdomain, Displayname, Department, 'usersm.gif' AS icon, Lastchanged
FROM          dbo.tblADusers
WHERE      (Department LIKE '') OR
                        (Department IS NULL)
ORDER BY Username