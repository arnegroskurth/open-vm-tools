# Changelog

## [unreleased]

## [1.2.1] - 2024-12-23

### Fixed

- Fixed potential startup delay

## [1.2.0] - 2024-12-23

### Added

- Activated logging for components `deployPkg`, `network`, `toolboxcmd`, `vmsvc`, `vmresset` and `vmusr`
- Now logging guestinfo stats when `LOGGGIN_LEVEL=debug`

## [1.1.0] - 2024-12-10

### Added

- Can now configure `LOGGING_LEVEL` for vmtoolsd
- Added `less` as common utility to container RPC context

## [1.0.0] - 2024-12-10

### Other

- Updated base image to `registry.fedoraproject.org/fedora-minimal:40`

## [0.2.0] - 2022-03-01

### Changed

- Switched to `registry.fedoraproject.org/fedora-minimal:34` as base image

### Added

- Now printing version of `open-vm-tools` on container start
- Added `net-tools`, `iproute` and `systemd` utilities to the container

## [0.1.0] - 2022-02-28

- Initial implementation
