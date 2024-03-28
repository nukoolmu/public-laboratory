

# OSI Modle Open Systems Interconnection)

flowchart TD
    A[Physical Layer] --> B[Data Link Layer]
    B --> C[Network Layer]
    C --> D[Transport Layer]
    D --> E[Session Layer]
    E --> F[Presentation Layer]
    F --> G[Application Layer]


| Layer                | Description                                                                                    |
|----------------------|------------------------------------------------------------------------------------------------|
| Application          | Responsible for providing network services directly to end-users or applications.             |
| Presentation         | Handles data translation, encryption, and compression.                                         |
| Session              | Establishes, maintains, and terminates connections between applications on different nodes.   |
| Transport            | Provides end-to-end communication between source and destination hosts.                        |
| Network              | Handles routing and forwarding of data packets between different networks.                     |
| Data Link            | Manages physical transmission circuit and provides error-free transmission of data frames.     |
| Physical             | Responsible for transmitting raw data over the physical medium.                                 |
