use lansweeperdb;

go


print 'Start exec hourly'
exec sp_ExecHourly
print 'Finish exec hourly'

print 'Start exec daily'
exec sp_ExecDaily
print 'Finish exec daily'