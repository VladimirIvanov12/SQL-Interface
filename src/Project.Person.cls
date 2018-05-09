Class Project.Person Extends (%Persistent, %Populate) [ SqlTableName = Person ]
{

	Property Name As %String(MAXLEN = 50) [ Required ];

	Property SecondName As %String(MAXLEN = 50) [ Required ];

	Property DateOfBirth As %Date;

	Property Sex As %String(MAXLEN = 1);

	Storage Default
	{
		<Data name="PersonDefaultData">
		<Value name="1">
		<Value>%%CLASSNAME</Value>
		</Value>
		<Value name="2">
		<Value>Name</Value>
		</Value>
		<Value name="3">
		<Value>SecondName</Value>
		</Value>
		<Value name="4">
		<Value>DateOfBirth</Value>
		</Value>
		<Value name="5">
		<Value>Sex</Value>
		</Value>
		</Data>
		<DataLocation>^Project.PersonD</DataLocation>
		<DefaultData>PersonDefaultData</DefaultData>
		<IdLocation>^Project.PersonD</IdLocation>
		<IndexLocation>^Project.PersonI</IndexLocation>
		<StreamLocation>^Project.PersonS</StreamLocation>
		<Type>%Library.CacheStorage</Type>
	}

}
