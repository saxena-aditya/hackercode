package com.web.hackercode.dao;

import java.util.List;

import com.web.hackercode.structures.InternshipForm;

public interface InternshipDAO {
	public boolean applyForInternship(InternshipForm itn);

	public List<InternshipForm> getInternshipApplications();

	public InternshipForm getInternshipApplication(String id);

	public boolean markInternshipLead(String id);

	public void addDrafterAccount(InternshipForm iform, String internUsername);
}
