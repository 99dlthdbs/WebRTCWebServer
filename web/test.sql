CREATE database bitProject;

use bitProject;
use web;

select *
from member;
select *
from func;

delete from func where member_m_id = 'heesun';
delete from member where m_id = 'heesun';

CREATE TABLE IF NOT EXISTS member
(
    m_id        VARCHAR(20) NOT NULL,
    g_idList    VARCHAR(999),
    m_pw        VARCHAR(20) NOT NULL,
    m_name      VARCHAR(20),
    m_gender    BOOLEAN,
    m_birth     VARCHAR(20),
    m_mail      VARCHAR(40),
    m_phone     VARCHAR(20),
    m_address   VARCHAR(50),
    m_timestamp timestamp,
    PRIMARY KEY (m_id)
) default CHARSET = utf8;

CREATE TABLE IF NOT EXISTS func
(
    f_stt       BOOLEAN,
    f_tts       BOOLEAN,
    member_m_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (member_m_id) REFERENCES member (m_id) ON UPDATE CASCADE ON DELETE RESTRICT
) default CHARSET = utf8;

CREATE TABLE IF NOT EXISTS chatGroup
(
    g_id    VARCHAR(20) NOT NULL,
    PRIMARY KEY (g_id)
) default CHARSET = utf8;


CREATE TABLE IF NOT EXISTS files
(
    f_id        VARCHAR(20),
    g_id        VARCHAR(20),
    f_name      VARCHAR(20),
    f_date      timestamp,
    f_content   BLOB,
    PRIMARY KEY (f_id),
    FOREIGN KEY (g_id) REFERENCES chatGroup (g_id) ON UPDATE CASCADE ON DELETE RESTRICT
)default CHARSET = utf8;


CREATE TABLE IF NOT EXISTS videos
(
    v_id        VARCHAR(20),
    g_id        VARCHAR(20),
    v_name      VARCHAR(20),
    v_date      timestamp,
    v_content   BLOB,
    PRIMARY KEY (v_id),
    FOREIGN KEY (g_id) REFERENCES chatGroup (g_id) ON UPDATE CASCADE ON DELETE RESTRICT
)default  CHARSET = utf8;


CREATE TABLE IF NOT EXISTS conference
(
    c_id        VARCHAR(20),
    c_hostId    VARCHAR(20),
    g_id        VARCHAR(20),
    c_pw        VARCHAR(20),
    c_date      timestamp,
    PRIMARY KEY (c_id),
    FOREIGN KEY (g_id) REFERENCES chatGroup (g_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (c_hostId) REFERENCES member (m_id) ON UPDATE CASCADE ON DELETE RESTRICT
)default CHARSET = utf8;

CREATE TABLE IF NOT EXISTS reserve
(
    r_id        VARCHAR(20),
    g_id        VARCHAR(20),
    r_date      timestamp,
    c_pw        VARCHAR(20),
    PRIMARY KEY (r_id),
    FOREIGN KEY (g_id) REFERENCES chatGroup (g_id) ON UPDATE CASCADE ON DELETE RESTRICT
)default CHARSET = utf8;

