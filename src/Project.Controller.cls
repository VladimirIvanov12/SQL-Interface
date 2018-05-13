Class Project.Controller Extends (%Persistent, %Populate)
{

ClassMethod addQueryToHistory(query As %String)
{
  SET q = query
  SET request = "INSERT INTO Project.Query (Request, Username, IsArchived) VALUES (?, ?, ?)"
  SET tStatement = ##class(%SQL.Statement).%New(0,"Sample")
  SET qStatus = tStatement.%Prepare(request)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
  SET rtn = tStatement.%Execute(q, $USERNAME, 0)
  IF rtn.%SQLCODE=0 {
    WRITE !,"Insert succeeded"
    WRITE !,"Row count=",rtn.%ROWCOUNT
    WRITE !,"Row ID=",rtn.%ROWID }
  ELSEIF rtn.%SQLCODE=-119 {
    WRITE !,"Duplicate record not written",!,rtn.%Message
    QUIT }
  ELSE {
    WRITE !,"Insert failed, SQLCODE=",rtn.%SQLCODE }
}

ClassMethod deleteQuery(Id As %Integer)
{
  SET request = "DELETE FROM Project.Query WHERE Id = (?)"
  SET tStatement = ##class(%SQL.Statement).%New(0,"Sample")
  SET qStatus = tStatement.%Prepare(request)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
  SET rtn = tStatement.%Execute(Id)
  
  WRITE !,"Row count=",rtn.%ROWCOUNT
  WRITE !,"Row ID=",rtn.%ROWID
}

ClassMethod updateQuery(Id As %Integer, Request As %String)
{
  SET request = "UPDATE Project.Query SET Request = (?) WHERE Id = (?)"
  SET tStatement = ##class(%SQL.Statement).%New(0,"Sample")
  SET qStatus = tStatement.%Prepare(request)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
  SET rtn = tStatement.%Execute(Request, Id)
  
  WRITE !,"Row count=",rtn.%ROWCOUNT
  WRITE !,"Row ID=",rtn.%ROWID
}

ClassMethod toggleArchiveStatus(Id As %Integer, isArchived As %Boolean)
{
  SET request = "UPDATE Project.Query SET IsArchived = (?) WHERE Id = (?)"
  SET tStatement = ##class(%SQL.Statement).%New(0,"Sample")
  SET qStatus = tStatement.%Prepare(request)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
  SET rtn = tStatement.%Execute(isArchived, Id)
  
  WRITE !,"Row count=",rtn.%ROWCOUNT
  WRITE !,"Row ID=",rtn.%ROWID
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
