

CREATE VIEW [web40repuserpictures] AS
SELECT TOP 1000000 '<img src="thumbnail.aspx?user=' + Username + '&domain=' + Userdomain + '&size=26" class="rimage"/>' AS Picture, Displayname, Firstname,
Lastname, Username, Userdomain, Department
FROM tblADusers
ORDER BY Displayname