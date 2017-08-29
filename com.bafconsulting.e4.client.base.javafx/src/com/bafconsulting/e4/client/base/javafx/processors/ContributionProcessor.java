/*******************************************************************************
 * Copyright (c) 2011 Kai Toedter and others.
 * 
 * All rights reserved. This program and the accompanying materials 
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html.
 * 
 * Contributors:
 *     Kai Toedter - initial API and implementation
 ******************************************************************************/

package com.bafconsulting.e4.client.base.javafx.processors;

import javax.inject.Inject;
import javax.inject.Named;
import org.eclipse.e4.core.di.annotations.Execute;
import org.eclipse.e4.ui.model.application.commands.MHandler;
import org.eclipse.e4.ui.model.application.ui.basic.MPart;
import org.eclipse.e4.ui.model.application.ui.basic.MWindow;

@SuppressWarnings("restriction")
public class ContributionProcessor {

	@Inject
	@Named("mainWindow")
	private MWindow mainWindow;

	@Inject
	@Named("part:detailsView")
	private MPart detailsView;

	@Inject
	@Named("part:listView")
	private MPart listView;

	@Inject
	@Named("handler:switchTheme")
	private MHandler switchThemeHandler;

	@Inject
	@Named("handler:exit")
	private MHandler exitHandler;

	@Execute
	public void process() {
		mainWindow.setLabel("e4 JavaFX Contacts Demo");
		// mainWindow.setLabel("%windowTitle"); // does not work
		listView.setContributionURI("bundleclass://com.bafconsulting.e4.demo.contacts.javafx/com.bafconsulting.e4.demo.contacts.javafx.views.ListView");
		detailsView
				.setContributionURI("bundleclass://com.bafconsulting.e4.demo.contacts.javafx/com.bafconsulting.e4.demo.contacts.javafx.views.DetailsView");
		switchThemeHandler
				.setContributionURI("bundleclass://com.bafconsulting.e4.demo.contacts.javafx/com.bafconsulting.e4.demo.contacts.javafx.handlers.SwitchThemeHandler");
		exitHandler
				.setContributionURI("bundleclass://com.bafconsulting.e4.demo.contacts.javafx/com.bafconsulting.e4.demo.contacts.javafx.handlers.ExitHandler");
	}
}
