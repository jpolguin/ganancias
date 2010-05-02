CREATE TABLE `comparacion_sueldos` (
  `id` int(11) NOT NULL auto_increment,
  `salario_bruto_actual` decimal(10,2) default '0.00',
  `salario_bruto_futuro` decimal(10,2) default '0.00',
  `ticket_actual` decimal(6,2) default '0.00',
  `ticket_futuro` decimal(6,2) default '0.00',
  `bonus_actual` decimal(10,2) default '0.00',
  `bonus_futuro` decimal(10,2) default '0.00',
  `cantidad_hijos` int(11) default '0',
  `otras_cargas` int(11) default '0',
  `deduce_conyuge` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `info_news` (
  `id` int(11) NOT NULL auto_increment,
  `titulo` varchar(255) default NULL,
  `descripcion` varchar(255) default NULL,
  `url_noticia` varchar(255) default NULL,
  `categoria` varchar(255) default NULL,
  `fecha` date default NULL,
  `mostrar` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_info_news_on_fecha` (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `monthly_salaries` (
  `id` int(11) NOT NULL auto_increment,
  `month` varchar(255) default NULL,
  `gross_salary` decimal(10,2) default '0.00',
  `ticket` decimal(6,2) default '0.00',
  `bonus` decimal(10,2) default '0.00',
  `salary_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `positions` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `reduction_taxes` (
  `id` int(11) NOT NULL auto_increment,
  `month` varchar(255) default NULL,
  `from_salary` decimal(12,2) default '0.00',
  `to_salary` decimal(12,2) default '0.00',
  `reduction_percentage` decimal(8,2) default '0.00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `revenue_parameter_details` (
  `id` int(11) NOT NULL auto_increment,
  `month` varchar(255) default NULL,
  `value` decimal(10,2) default '0.00',
  `revenue_parameter_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `revenue_parameters` (
  `id` int(11) NOT NULL auto_increment,
  `year` int(11) default NULL,
  `name` varchar(255) default NULL,
  `value` decimal(10,2) default '0.00',
  `has_detail` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `revenue_taxes` (
  `id` int(11) NOT NULL auto_increment,
  `month` varchar(255) default NULL,
  `from_salary` decimal(12,2) default '0.00',
  `to_salary` decimal(12,2) default '0.00',
  `tax_amount` decimal(12,2) default '0.00',
  `tax_rate` decimal(8,2) default '0.00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `salaries` (
  `id` int(11) NOT NULL auto_increment,
  `position_id` int(11) NOT NULL,
  `cantidad_hijos` int(11) default '0',
  `otras_cargas` int(11) default '0',
  `deduce_conyuge` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) default NULL,
  `data` text,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `special_discounts` (
  `id` int(11) NOT NULL auto_increment,
  `month` varchar(255) default NULL,
  `seguro_retiro` decimal(10,2) default '0.00',
  `seguro_vida` decimal(10,2) default '0.00',
  `cuota_medica` decimal(10,2) default '0.00',
  `donacion` decimal(10,2) default '0.00',
  `honorario_medico` decimal(10,2) default '0.00',
  `intereses_hipotecarios` decimal(10,2) default '0.00',
  `personal_domestico` decimal(10,2) default '0.00',
  `aportes_voluntarios_afjp` decimal(10,2) default '0.00',
  `salary_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO schema_info (version) VALUES (24)