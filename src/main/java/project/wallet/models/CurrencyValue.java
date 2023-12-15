package project.wallet.models;

import lombok.Builder;
import lombok.Getter;

import java.sql.Timestamp;

@Getter
@Builder
public class CurrencyValue {
    private Long CurrencyValueId;
    private Currency idDeviseSource;
    private Currency idDeviceDest;
    private Double amount;
    private Timestamp effectDate;
}
