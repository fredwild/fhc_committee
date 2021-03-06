

-- 
-- fhc_committee_development 
-- 

SET sql_mode='ANSI_QUOTES'; 
SET character_set_client = utf8 ; 

drop database if exists fhc_committee_development;
create database if not exists fhc_committee_development;
use fhc_committee_development;


drop table if exists "months";
create table "months" (
    "id"                int          not null auto_increment,
    "seq_no"            int,
    "code"              varchar(5),
    "description"       varchar(60),
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "documents";
create table "documents" (
    "id"                int          not null auto_increment,
    "name"              varchar(60),
    "description"       mediumtext,
    "doc_file"          mediumtext,
    "seq_no"            int,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "events";
create table "events" (
    "id"                int          not null auto_increment,
    "year"              int,
    "objectives"        mediumtext,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "announcements";
create table "announcements" (
    "id"                int          not null auto_increment,
    "topic"             varchar(60),
    "description"       mediumtext,
    "seq_no"            int,
    "task_task_obj_id"  int,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "volunteers";
create table "volunteers" (
    "id"                int          not null auto_increment,
    "l_name"            varchar(60),
    "f_name"            varchar(60),
    "full_name"         varchar(60),
    "email"             varchar(60),
    "email_confirmed"   bool,
    "user_name"         varchar(60),
    "passwd"            varchar(40),
    "address_line1"     varchar(60),
    "address_line2"     varchar(60),
    "city"              varchar(60),
    "state"             varchar(60),
    "zipcode"           varchar(60),
    "cell_phone"        varchar(60),
    "home_phone"        varchar(60),
    "work_phone"        varchar(60),
    "missionary_ind"    bool,
    "created_at"        date,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "meetings";
create table "meetings" (
    "id"                int          not null auto_increment,
    "name"              varchar(60),
    "purpose"           varchar(100),
    "agenda"            mediumtext,
    "month_week"        int,
    "notes"             mediumtext,
    "seq_no"            int,
    "month_month_id"    int,
    "facilitator_committee_role_id" int,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "task_objs";
create table "task_objs" (
    "id"                int          not null auto_increment,
    "name"              varchar(60),
    "description"       mediumtext,
    "month_week"        int,
    "key_task"          bool,
    "seq_no"            int,
    "month_month_id"    int,
    "meeting_meeting_id" int,
    "predecessor_task_obj_id" int,
    "commitee_committee_id" int,
    "committee_role_committee_role_id" int,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "committees";
create table "committees" (
    "id"                int          not null auto_increment,
    "code"              varchar(60),
    "name"              varchar(60),
    "description"       mediumtext,
    "picture"           varchar(60),
    "seq_no"            int,
    "oversight_role_assignment_id" int,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "website_functions";
create table "website_functions" (
    "id"                int          not null auto_increment,
    "name"              varchar(60),
    "description"       mediumtext,
    "link"              mediumtext,
    "seq_no"            int,
    "task_task_obj_id"  int,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "committee_roles";
create table "committee_roles" (
    "id"                int          not null auto_increment,
    "role_name"         varchar(60),
    "description"       mediumtext,
    "calling_required"  bool,
    "name_tag_needed"   bool,
    "seq_no"            int,
    "committee_committee_id" int,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "role_assignments";
create table "role_assignments" (
    "id"                int          not null auto_increment,
    "name"              varchar(60),
    "event_event_id"    int,
    "volunteer_volunteer_id" int,
    "committee_role_committee_role_id" int,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "resources";
create table "resources" (
    "id"                int          not null auto_increment,
    "name"              varchar(60),
    "description"       mediumtext,
    "picture"           varchar(60),
    "doc_file"          mediumtext,
    "link"              mediumtext,
    "seq_no"            int,
    primary key ("id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


alter table "announcements" add constraint "fk_announcements_task_task_obj_id" foreign key ("task_task_obj_id") references "task_objs" ("id") on delete set null;
alter table "meetings" add constraint "fk_meetings_month_month_id" foreign key ("month_month_id") references "months" ("id") on delete set null;
alter table "meetings" add constraint "fk_meetings_facilitator_committee_role_id" foreign key ("facilitator_committee_role_id") references "committee_roles" ("id") on delete set null;
alter table "task_objs" add constraint "fk_task_objs_month_month_id" foreign key ("month_month_id") references "months" ("id") on delete set null;
alter table "task_objs" add constraint "fk_task_objs_meeting_meeting_id" foreign key ("meeting_meeting_id") references "meetings" ("id") on delete set null;
alter table "task_objs" add constraint "fk_task_objs_predecessor_task_obj_id" foreign key ("predecessor_task_obj_id") references "task_objs" ("id") on delete set null;
alter table "task_objs" add constraint "fk_task_objs_commitee_committee_id" foreign key ("commitee_committee_id") references "committees" ("id") on delete set null;
alter table "task_objs" add constraint "fk_task_objs_committee_role_committee_role_id" foreign key ("committee_role_committee_role_id") references "committee_roles" ("id") on delete set null;
alter table "committees" add constraint "fk_committees_oversight_role_assignment_id" foreign key ("oversight_role_assignment_id") references "role_assignments" ("id") on delete set null;
alter table "website_functions" add constraint "fk_website_functions_task_task_obj_id" foreign key ("task_task_obj_id") references "task_objs" ("id") on delete set null;
alter table "committee_roles" add constraint "fk_committee_roles_committee_committee_id" foreign key ("committee_committee_id") references "committees" ("id") on delete cascade;
alter table "role_assignments" add constraint "fk_role_assignments_event_event_id" foreign key ("event_event_id") references "events" ("id") on delete set null;
alter table "role_assignments" add constraint "fk_role_assignments_volunteer_volunteer_id" foreign key ("volunteer_volunteer_id") references "volunteers" ("id") on delete set null;
alter table "role_assignments" add constraint "fk_role_assignments_committee_role_committee_role_id" foreign key ("committee_role_committee_role_id") references "committee_roles" ("id") on delete set null;

drop table if exists "meetings_invitees_committee_roles";
create table "meetings_invitees_committee_roles" (
    "meeting_src_id"      int,
    "committee_role_dest_id"    int,
    constraint "fk_meetings_invitees_committee_roles_sid" foreign key ("meeting_src_id") references "meetings" ("id") on delete cascade,
    constraint "fk_meetings_invitees_committee_roles_did" foreign key ("committee_role_dest_id") references "committee_roles" ("id") on delete cascade,
    primary key ("meeting_src_id", "committee_role_dest_id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

drop table if exists "meetings_resources_resources";
create table "meetings_resources_resources" (
    "meeting_src_id"      int,
    "resource_dest_id"    int,
    constraint "fk_meetings_resources_resources_sid" foreign key ("meeting_src_id") references "meetings" ("id") on delete cascade,
    constraint "fk_meetings_resources_resources_did" foreign key ("resource_dest_id") references "resources" ("id") on delete cascade,
    primary key ("meeting_src_id", "resource_dest_id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

drop table if exists "task_objs_documents_documents";
create table "task_objs_documents_documents" (
    "task_obj_src_id"      int,
    "document_dest_id"    int,
    constraint "fk_task_objs_documents_documents_sid" foreign key ("task_obj_src_id") references "task_objs" ("id") on delete cascade,
    constraint "fk_task_objs_documents_documents_did" foreign key ("document_dest_id") references "documents" ("id") on delete cascade,
    primary key ("task_obj_src_id", "document_dest_id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

drop table if exists "task_objs_resources_resources";
create table "task_objs_resources_resources" (
    "task_obj_src_id"      int,
    "resource_dest_id"    int,
    constraint "fk_task_objs_resources_resources_sid" foreign key ("task_obj_src_id") references "task_objs" ("id") on delete cascade,
    constraint "fk_task_objs_resources_resources_did" foreign key ("resource_dest_id") references "resources" ("id") on delete cascade,
    primary key ("task_obj_src_id", "resource_dest_id")
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
