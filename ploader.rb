require 'dbi'

begin
     # connect to the Oracle database
     dbh = DBI.connect('DBI:OCI8://192.168.195.58:1521/xe', 
                      'cmmi', 'cmmiPass')
                      
     sth = dbh.prepare('select * from platform_type')
     sth.execute
     
     while row=sth.fetch do
       p row
     end     

rescue DBI::DatabaseError => e
     puts "An error occurred"
     puts "Error code:    #{e.err}"
     puts "Error message: #{e.errstr}"
     dbh.rollback
ensure
     # disconnect from server
     dbh.disconnect if dbh
end