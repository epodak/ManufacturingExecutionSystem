package com.bafconsulting.configurator.portal.cucumber.stepdefs;

import com.bafconsulting.configurator.portal.PortalApp;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.ResultActions;

import org.springframework.boot.test.context.SpringBootTest;

@WebAppConfiguration
@SpringBootTest
@ContextConfiguration(classes = PortalApp.class)
public abstract class StepDefs {

    protected ResultActions actions;

}
