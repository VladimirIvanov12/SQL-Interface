Class Project.Controller Extends (%Persistent, %Populate)
{

Property queries As list Of %String;

ClassMethod addQueryToHistory(query As %String) As %String
{
  SET q = query
  SET request = "INSERT INTO Project.Query (Request, Username) VALUES (?, ?)"
  SET tStatement = ##class(%SQL.Statement).%New(0,"Sample")
  SET qStatus = tStatement.%Prepare(request)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
  SET rtn = tStatement.%Execute(q, $USERNAME)
  IF rtn.%SQLCODE=0 {
    WRITE !,"Insert succeeded"
    WRITE !,"Row count=",rtn.%ROWCOUNT
    WRITE !,"Row ID=",rtn.%ROWID }
  ELSEIF rtn.%SQLCODE=-119 {
    WRITE !,"Duplicate record not written",!,rtn.%Message
    QUIT }
  ELSE {
    WRITE !,"Insert failed, SQLCODE=",rtn.%SQLCODE }
    
    RETURN "success"
}

ClassMethod deleteQuery(Id As %Integer) As %String
{
  SET request = "DELETE FROM Project.Query WHERE Id = (?)"
  SET tStatement = ##class(%SQL.Statement).%New(0,"Sample")
  SET qStatus = tStatement.%Prepare(request)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
  SET rtn = tStatement.%Execute(Id)
  
  WRITE !,"Row count=",rtn.%ROWCOUNT
  WRITE !,"Row ID=",rtn.%ROWID
  
  RETURN "success"
}

ClassMethod updateQuery(Id As %Integer, Request As %String) As %String
{
  SET request = "UPDATE Project.Query SET Request = (?) WHERE Id = (?)"
  SET tStatement = ##class(%SQL.Statement).%New(0,"Sample")
  SET qStatus = tStatement.%Prepare(request)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
  SET rtn = tStatement.%Execute(Request, Id)
  
  WRITE !,"Row count=",rtn.%ROWCOUNT
  WRITE !,"Row ID=",rtn.%ROWID
  
  RETURN "success"
}

ClassMethod runQuery(query As %String) As Project.Person
{
    //SET query = "SELECT Name,SecondName, Sex, DateOfBirth FROM Project.Person"
    //SET p = ##class(Project.Controller).runQuery(query)
    
      SET myquery = query
        SET tStatement = ##class(%SQL.Statement).%New()
        SET qStatus = tStatement.%Prepare(myquery)
        IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
        SET rset = tStatement.%Execute()
        DO rset.%Display()
        WRITE !,"End of data"
        WRITE !, "HISTORY:", Project.Controller.queries
        RETURN rset
}

ClassMethod getAllQueries() As %String [ ZenMethod ]
{
  SET myquery="SELECT ID, Request, Username FROM Project.Query"
    SET rset=##class(%ResultSet.SQL).%Prepare(myquery,.err,"")
    SET result=""
    WHILE rset.%Next() {
      SET Id = rset.%Get("Id")
      WRITE "Id=", Id, "   "
      SET req = rset.%Get("Request")
      WRITE "Request=", req, "   "
      SET username = rset.%Get("Username")
      WRITE "Username=", username, !
      SET conc = Id_"%%"_req_"%%"_username_"/n"
      SET result = result_conc
    }
    
  
  return result
}

Storage Default
{
<Data name="ControllerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>queries</Value>
</Value>
</Data>
<DataLocation>^Project.ControllerD</DataLocation>
<DefaultData>ControllerDefaultData</DefaultData>
<IdLocation>^Project.ControllerD</IdLocation>
<IndexLocation>^Project.ControllerI</IndexLocation>
<StreamLocation>^Project.ControllerS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
