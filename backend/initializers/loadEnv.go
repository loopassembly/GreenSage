package initializers

import (
	"time"

	"github.com/spf13/viper"
)

type Config struct {
	DBPath       string        `mapstructure:"DB_PATH" default:"./mydb.sqlite"`
	JwtSecret    string        `mapstructure:"JWT_SECRET"`
	JwtExpiresIn time.Duration `mapstructure:"JWT_EXPIRED_IN"`
	JwtMaxAge    int           `mapstructure:"JWT_MAXAGE"`
	ClientOrigin string        `mapstructure:"CLIENT_ORIGIN"`

	// ? SMTP credenials
	EmailFrom string `mapstructure:"EMAIL_FROM"`
	SMTPHost  string `mapstructure:"SMTP_HOST"`
	SMTPPass  string `mapstructure:"SMTP_PASS"`
	SMTPPort  int    `mapstructure:"SMTP_PORT"`
	SMTPUser  string `mapstructure:"SMTP_USER"`

	// ?google auth
	GoogleClientID         string `mapstructure:"GOOGLE_OAUTH_CLIENT_ID"`
	GoogleClientSecret     string `mapstructure:"GOOGLE_OAUTH_CLIENT_SECRET"`
	GoogleOAuthRedirectUrl string `mapstructure:"GOOGLE_OAUTH_REDIRECT_URL"`

	// ?github auth
	GitHubClientID         string `mapstructure:"GITHUB_OAUTH_CLIENT_ID"`
	GitHubClientSecret     string `mapstructure:"GITHUB_OAUTH_CLIENT_SECRET"`
	GitHubOAuthRedirectUrl string `mapstructure:"GITHUB_OAUTH_REDIRECT_URL"`

	// ?stackoverflow auth
	StackoverflowClientID         string `mapstructure:"STACKOVERFLOW_OAUTH_CLIENT_ID"`
	StackOverflowClientSecret     string `mapstructure:"STACKOVERFLOW_OAUTH_CLIENT_SECRET"`
	StackOverflowOAuthRedirectUrl string `mapstructure:"STACKOVERFLOW_OAUTH_REDIRECT_URL"`
}

func LoadConfig(path string) (config Config, err error) {
	viper.AddConfigPath(path)
	viper.SetConfigType("env")
	viper.SetConfigName(".env")

	viper.AutomaticEnv()

	err = viper.ReadInConfig()
	if err != nil {
		return
	}

	err = viper.Unmarshal(&config)
	return
}