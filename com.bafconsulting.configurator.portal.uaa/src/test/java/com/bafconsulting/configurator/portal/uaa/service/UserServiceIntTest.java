package com.bafconsulting.configurator.portal.uaa.service;

import com.bafconsulting.configurator.portal.uaa.AbstractCassandraTest;
import com.bafconsulting.configurator.portal.uaa.UaaApp;
import com.bafconsulting.configurator.portal.uaa.domain.User;
import com.bafconsulting.configurator.portal.uaa.config.Constants;
import com.bafconsulting.configurator.portal.uaa.repository.UserRepository;
import com.bafconsulting.configurator.portal.uaa.service.dto.UserDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


import java.time.Instant;
import java.util.List;

import static org.assertj.core.api.Assertions.*;

/**
 * Test class for the UserResource REST controller.
 *
 * @see UserService
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = UaaApp.class)
public class UserServiceIntTest extends AbstractCassandraTest {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Test
    public void assertThatAnonymousUserIsNotGet() {
        final List<UserDTO> allManagedUsers = userService.getAllManagedUsers();
        assertThat(allManagedUsers.stream()
            .noneMatch(user -> Constants.ANONYMOUS_USER.equals(user.getLogin())))
            .isTrue();
    }
}
