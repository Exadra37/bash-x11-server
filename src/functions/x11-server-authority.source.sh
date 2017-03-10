#!/bin/bash
# @package exadra37-bash/x11-server
# @link    https://gitlab.com/u/exadra37-bash/x11-server
# @since   2017/03/08
# @license GPL-3.0
# @author  Exadra37(Paulo Silva) <exadra37ingmailpointcom>
#
# Social Links:
# @link    Auhthor:  https://exadra37.com
# @link    Github:   https://gitlab.com/Exadra37
# @link    Github:   https://github.com/Exadra37
# @link    Linkedin: https://uk.linkedin.com/in/exadra37
# @link    Twitter:  https://twitter.com/Exadra37


########################################################################################################################
# Sourcing
########################################################################################################################

    ebxs_functions_dir=$(cd "$( dirname "${BASH_SOURCE}" )" && pwd )

    source "${ebxs_functions_dir}"/../../vendor/exadra37-bash/folders-manipulator/src/functions/create-folder.source.sh


########################################################################################################################
# Functions
########################################################################################################################

    # @link http://wiki.ros.org/docker/Tutorials/GUI#The_isolated_way
    function Setup_X11_Server_Authority()
    {
        local _x11_authority_file="${1}"

        Create_Folder_To_File_If_Does_Not_Exist "${_x11_authority_file}"

        # Setup X11 server authentication
        touch "${_x11_authority_file}" &&
        xauth nlist "${DISPLAY}" | sed -e 's/^..../ffff/' | xauth -f "${_x11_authority_file}" nmerge -
    }
