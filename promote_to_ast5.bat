del t:\ruby_web_apps\rails2x\fhc_committee\app\*.*
copy c:\ruby_web_apps\rails2x\fhc_committee\app\*.* t:\ruby_web_apps\rails2x\fhc_committee\app\*.*
copy c:\ruby_web_apps\rails2x\fhc_committee\public\user_docs\*.* t:\ruby_web_apps\rails2x\fhc_committee\public\user_docs\*.*
mysql -u root --databases fhc_committee_development >t:\temp\fhc_committee_development.sql
mysql -h ast5 -u diana -pweldd9 <t:\temp\fhc_committee_development.sql

