enum UserRole { CLIENT, CATERING_COMPANY, ADMIN, NONE }

Map<String, UserRole> userRoleMap = {
  "": UserRole.NONE,
  "ADMIN": UserRole.ADMIN,
  "CATERING": UserRole.CATERING_COMPANY,
  "CLIENT": UserRole.CLIENT
};

Map<UserRole, String> userRoleToStringMap = {
  UserRole.NONE: "",
  UserRole.ADMIN: "ADMIN",
  UserRole.CATERING_COMPANY: "CATERING",
  UserRole.CLIENT: "CLIENT"
};
