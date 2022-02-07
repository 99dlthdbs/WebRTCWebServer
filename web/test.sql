CREATE database bitProject;

use bitProject;

CREATE TABLE IF NOT EXISTS member
(
    m_id        VARCHAR(20) NOT NULL,
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

select *
from member;
select *
from func;

drop table member;


CREATE TABLE IF NOT EXISTS func
(
    f_stt       BOOLEAN,
    f_tts       BOOLEAN,
    member_m_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (member_m_id) REFERENCES member (m_id) ON UPDATE CASCADE ON DELETE RESTRICT
) default CHARSET = utf8;