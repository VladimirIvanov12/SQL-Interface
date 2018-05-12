Class Project.Query Extends %Persistent [ SqlTableName = Query ]
{

Property Request As %String(MAXLEN = 256) [ Required ];

Property Username As %String(MAXLEN = 256);

Storage Default
{
<Data name="QueryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Request</Value>
</Value>
<Value name="3">
<Value>Username</Value>
</Value>
</Data>
<DataLocation>^Project.QueryD</DataLocation>
<DefaultData>QueryDefaultData</DefaultData>
<IdLocation>^Project.QueryD</IdLocation>
<IndexLocation>^Project.QueryI</IndexLocation>
<StreamLocation>^Project.QueryS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
