package com.gjob.backend.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SaraminDTO {
	private String co_seq;
	private String co_name;
	private String co_name_href;
	private String co_title;
	private String co_job_name;
	private String co_location_name;
	private String co_career;
	private String co_start_date;
	private String co_end_date;
	private String co_url;
}
