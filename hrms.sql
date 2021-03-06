-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.candidate_cv_confidentialities
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    cv_confidentiality boolean NOT NULL,
    candidate_id integer,
    CONSTRAINT candidate_cv_confidentialities_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.candidate_favorities
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_advertisement_id integer NOT NULL,
    candidate_id integer,
    CONSTRAINT candidate_favorities_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.candidate_job_applications
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    candidate_id integer NOT NULL,
    job_advertisement_id integer NOT NULL,
    application_date date NOT NULL,
    is_active boolean NOT NULL,
    CONSTRAINT candidate_job_applications_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.candidates
(
    id integer NOT NULL,
    first_name character varying(35) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(35) COLLATE pg_catalog."default" NOT NULL,
    identity_number character varying(11) COLLATE pg_catalog."default" NOT NULL,
    birth_year date NOT NULL,
    is_active boolean NOT NULL,
    record_date date,
    CONSTRAINT candidates_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.cities
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cities_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.cover_letter
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    candidate_id integer NOT NULL,
    cover_letter character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cover_letter_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.curriculum_vitae
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    candidate_id integer NOT NULL,
    photo character varying COLLATE pg_catalog."default",
    github_link character varying COLLATE pg_catalog."default",
    linkedin_link character varying COLLATE pg_catalog."default",
    description character varying COLLATE pg_catalog."default",
    is_active boolean,
    creation_date date NOT NULL,
    last_updated_date date,
    CONSTRAINT curriculum_vitae_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE public.curriculum_vitae
    IS 'Cv tablosu';

CREATE TABLE IF NOT EXISTS public.employee_confirms
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employee_id integer NOT NULL,
    is_confirmed boolean NOT NULL,
    confirm_date date,
    employer_id integer NOT NULL,
    CONSTRAINT employee_confirms_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.employees
(
    id integer NOT NULL,
    first_name character varying(35) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(35) COLLATE pg_catalog."default" NOT NULL,
    record_date date NOT NULL,
    is_active boolean NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.employer_update
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employer_id integer NOT NULL,
    employee_id integer,
    is_confirm boolean NOT NULL,
    confirm_date date,
    employer_update_dto jsonb,
    CONSTRAINT employer_update_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.employers
(
    id integer NOT NULL,
    company_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    web_address character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone_number character varying(12) COLLATE pg_catalog."default" NOT NULL,
    is_active boolean NOT NULL,
    record_date date NOT NULL,
    is_confirm boolean,
    CONSTRAINT employers_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.foreign_language
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    creation_date date NOT NULL,
    language character varying COLLATE pg_catalog."default" NOT NULL,
    level integer NOT NULL,
    candidate_id integer,
    CONSTRAINT foreign_language_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.graduate_degree
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    description character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT graduate_degree_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.job_advertisements
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_title_id integer NOT NULL,
    city_id integer NOT NULL,
    job_detail character varying(400) COLLATE pg_catalog."default" NOT NULL,
    min_wage integer,
    max_wage integer,
    is_active boolean NOT NULL,
    application_deadline date NOT NULL,
    employer_id integer NOT NULL,
    count_of_open_position integer NOT NULL,
    created_date date NOT NULL,
    working_hours_id integer NOT NULL,
    manner_of_work_id integer NOT NULL,
    is_confirm boolean NOT NULL,
    position_level_id integer NOT NULL,
    CONSTRAINT job_advertisements_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.job_advertisements_confirm_employee
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employee_id integer NOT NULL,
    job_advertisement_id integer NOT NULL,
    confirm_date date NOT NULL,
    is_confirmed boolean NOT NULL,
    CONSTRAINT job_advertisements_confirm_employee_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.job_experience
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    company_name character varying COLLATE pg_catalog."default" NOT NULL,
    starting_date date NOT NULL,
    ending_date date,
    creation_date date NOT NULL,
    job_title_id integer NOT NULL,
    candidate_id integer,
    CONSTRAINT job_experience_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.job_titles
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    title character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT job_titles_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.languages
(
    id integer NOT NULL,
    language character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT languages_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.manner_of_works
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    manner_of_work character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT manner_of_works_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.position_levels
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    position_level character varying COLLATE pg_catalog."default" NOT NULL,
    photo character varying COLLATE pg_catalog."default",
    CONSTRAINT position_levels_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.register_confirm_tokens
(
    id integer NOT NULL DEFAULT nextval('register_confirm_tokens_id_seq'::regclass),
    confirmed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    token character varying(255) COLLATE pg_catalog."default" NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT register_confirm_tokens_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.school
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    school_name character varying COLLATE pg_catalog."default" NOT NULL,
    graduate_degree_id integer NOT NULL,
    school_department character varying COLLATE pg_catalog."default",
    starting_date date NOT NULL,
    ending_date date,
    creation_date date NOT NULL,
    candidate_id integer,
    CONSTRAINT school_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.social_media
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    candidate_id integer NOT NULL,
    github_link character varying COLLATE pg_catalog."default",
    linkedin_link character varying COLLATE pg_catalog."default",
    CONSTRAINT social_media_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.techs
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    description character varying COLLATE pg_catalog."default" NOT NULL,
    creation_date date NOT NULL,
    candidate_id integer,
    CONSTRAINT techs_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(320) COLLATE pg_catalog."default" NOT NULL,
    password character varying(250) COLLATE pg_catalog."default" NOT NULL,
    photo character varying COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.verification_codes
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    code character varying(38) COLLATE pg_catalog."default" NOT NULL,
    is_verified boolean NOT NULL,
    verified_date date,
    user_id integer NOT NULL,
    CONSTRAINT verification_codes_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.working_hours
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    working_hour character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT working_hours_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.candidate_cv_confidentialities
    ADD CONSTRAINT candidate_cv_confidentialities_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.candidate_favorities
    ADD CONSTRAINT candidate_favorities_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.candidate_favorities
    ADD CONSTRAINT candidate_favorities_job_advertisement_id_fkey FOREIGN KEY (job_advertisement_id)
    REFERENCES public.job_advertisements (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.candidate_job_applications
    ADD CONSTRAINT candidate_job_applications_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.candidate_job_applications
    ADD CONSTRAINT candidate_job_applications_job_advertisement_id_fkey FOREIGN KEY (job_advertisement_id)
    REFERENCES public.job_advertisements (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.candidates
    ADD CONSTRAINT candidates_id_fkey FOREIGN KEY (id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS candidates_pkey
    ON public.candidates(id);


ALTER TABLE IF EXISTS public.cover_letter
    ADD CONSTRAINT cover_letter_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.curriculum_vitae
    ADD CONSTRAINT curriculum_vitae_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.employee_confirms
    ADD CONSTRAINT employee_confirms_employer_id_fkey FOREIGN KEY (employer_id)
    REFERENCES public.employers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.employees
    ADD CONSTRAINT employees_id_fkey FOREIGN KEY (id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS employees_pkey
    ON public.employees(id);


ALTER TABLE IF EXISTS public.employer_update
    ADD CONSTRAINT employer_update_employee_id_fkey FOREIGN KEY (employee_id)
    REFERENCES public.employees (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.employer_update
    ADD CONSTRAINT employer_update_employer_id_fkey FOREIGN KEY (employer_id)
    REFERENCES public.employers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.employers
    ADD CONSTRAINT employers_id_fkey FOREIGN KEY (id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS employers_pkey
    ON public.employers(id);


ALTER TABLE IF EXISTS public.foreign_language
    ADD CONSTRAINT foreign_language_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.job_advertisements
    ADD CONSTRAINT job_advertisements_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public.cities (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.job_advertisements
    ADD CONSTRAINT job_advertisements_employer_id_fkey FOREIGN KEY (employer_id)
    REFERENCES public.employers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.job_advertisements
    ADD CONSTRAINT job_advertisements_job_title_id_fkey FOREIGN KEY (job_title_id)
    REFERENCES public.job_titles (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.job_advertisements
    ADD CONSTRAINT job_advertisements_manner_of_work_id_fkey FOREIGN KEY (manner_of_work_id)
    REFERENCES public.manner_of_works (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.job_advertisements
    ADD CONSTRAINT job_advertisements_position_level_id_fkey FOREIGN KEY (position_level_id)
    REFERENCES public.position_levels (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.job_advertisements
    ADD CONSTRAINT job_advertisements_working_hours_id_fkey FOREIGN KEY (working_hours_id)
    REFERENCES public.working_hours (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.job_advertisements_confirm_employee
    ADD CONSTRAINT job_advertisements_confirm_employee_job_advertisement_id_fkey FOREIGN KEY (job_advertisement_id)
    REFERENCES public.job_advertisements (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.job_experience
    ADD CONSTRAINT job_experience_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.job_experience
    ADD CONSTRAINT job_experience_job_title_id_fkey FOREIGN KEY (job_title_id)
    REFERENCES public.job_titles (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.register_confirm_tokens
    ADD CONSTRAINT fk4uo5vsxxtady9dqko859erji0 FOREIGN KEY (user_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.school
    ADD CONSTRAINT school_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.school
    ADD CONSTRAINT school_graduate_degree_id_fkey FOREIGN KEY (graduate_degree_id)
    REFERENCES public.graduate_degree (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.social_media
    ADD CONSTRAINT social_media_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.techs
    ADD CONSTRAINT techs_candidate_id_fkey FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.verification_codes
    ADD CONSTRAINT verification_codes_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;