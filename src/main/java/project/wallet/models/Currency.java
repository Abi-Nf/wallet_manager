package project.wallet.models;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class Currency {
  private Long CurrencyId;
  private String name;
  private String country;
}
