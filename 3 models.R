## Load data and lme4
load(url("http://dl.dropboxusercontent.com/u/61803503/data/HSB.RData"))
head(dat)
library(lme4)

## Group Center Variables
dat$cent_ses <- with(dat, ses - ave(ses, id))

## Fully Unconditional
fu_mod <- lmer(mathach ~ 1 + (1 | id), data=dat)
summary(fu_mod)


## Partially Conditional
pc_mod <- lmer(mathach ~ cent_ses + (1 | id), data=dat)
summary(pc_mod)

## Fully Conditional
fc_mod <- lmer(mathach ~ cent_ses + (1 | id) + (1 | meanses) +(id | sector), data=dat)
summary(fc_mod)

